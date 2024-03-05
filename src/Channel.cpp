#include "Channel.hpp"
#include"EventLoop.hpp"
#include"logger.hpp"
#include <sys/epoll.h>
const int Channel::kNoneEvent=0;
const int Channel::kReadEvent=EPOLLIN | EPOLLPRI;
const int Channel::kWriteEvent=EPOLLOUT;
Channel::Channel(EventLoop *loop, int fd):loop_(loop)
    ,fd_(fd),events_(0),revents_(0),index_(-1),tied_(false)
{
}
Channel::~Channel(){}
 //防止当Channel被手动remove掉，channel还在执行回调
void Channel::tie(const std::shared_ptr<void>& obj)
{
    tie_=obj;
    tied_=true;
}
//当改变channel所表示fd的event事件后，update负责在poller里面更改fd相应事件epoll_ctl
void Channel::update()
{
    //通过channel所属的eventloop，调用poller相应的方法，注册fd的events事件
    loop_->updateChannel(this);
}
//在channel所属的eventLoop中，把当前的 channel删除掉
void Channel::remove()
{
    loop_->removeChannel(this);
}
/*
这个函数首先检查Channel对象是否与某个具体的对象（通常是TcpConnection对象）绑定，这是通过tied_成员变量来判断的。
如果Channel对象与某个对象绑定，那么在处理事件之前，需要确保这个对象还存在，这是通过tie_.lock()来实现的。如果这个对象还存在，
那么就调用handleEventWithGuard函数来处理事件。
如果Channel对象没有与任何对象绑定，那么直接调用handleEventWithGuard函数来处理事件。
这种设计可以防止在Channel对象处理事件的过程中，它所绑定的对象被析构，从而导致程序崩溃。
*/
void Channel::handleEvent(Timestamp receiveTime)
{
    std::shared_ptr<void>guard;
    if(tied_){
        guard=tie_.lock();
        if(guard){
            handleEventWithGuard(receiveTime);
        }
    }
    else{
        handleEventWithGuard(receiveTime);
    }
}
// 根据poller通知的channel发生的具体事件，由channel负责调用具体的回调操作
void Channel::handleEventWithGuard(Timestamp receiveTime)
{
    LOG_INFO("channel handleEvent revents:%d\n",revents_);
    if((revents_ & EPOLLHUP)&&!(revents_&EPOLLIN)){
        if(closeCallback_){
            closeCallback_();
        }
    }
    if(revents_&EPOLLERR){
        if(errorCallback_){
            errorCallback_();
        }
    }
    if(revents_&(EPOLLIN|EPOLLPRI)){
        if(readCallback_){
            readCallback_(receiveTime);
        }
    }
    if(revents_&EPOLLOUT){
        if(writeCallback_){
            writeCallback_();
        }
    }
}