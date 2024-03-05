#include"EpollPoller.hpp"
#include"logger.hpp"
#include"Channel.hpp"

#include<errno.h>
#include <unistd.h>
#include <string.h>
//channel未添加到poller中
const int kNew=-1;//channel的成员index_=-1
//channel已经添加到poller中
const int kAdded=1;
//channel从poller中删除
const int kDeletd=2;

// epoll_create
EpollPoller::EpollPoller(EventLoop *loop):Poller(loop)
    ,epollfd_(::epoll_create1(EPOLL_CLOEXEC))//epoll_create1方法
    ,events_(kInitEventListSize)
{
    if(epollfd_<0){
        LOG_FATAL("epoll_create error:%d\n",errno);
    }
}
// close epollfd_
EpollPoller::~EpollPoller()
{
    close(epollfd_);
}  
// 重写基类抽象的方法
// epoll_wait
Timestamp EpollPoller::poll(int timeoutMs, ChannelList *activeChannels)
{
    //实际上用LOG_DEBUG输出更合理
    LOG_INFO("func=%s=> fd total count:%lu\n",__FUNCTION__,channels_.size());
    //LOG_DEBUG("func=%s=> fd total count:%lu\n",__FUNCTION__,channels_.size());
    int numEvents=::epoll_wait(epollfd_,&*events_.begin(),static_cast<int>(events_.size()),timeoutMs);//取vector的首地址  &*events_.begin();
    int savedErrno=errno;
    Timestamp now(Timestamp::now());

    if(numEvents>0){
        LOG_INFO("%d events happend \n",numEvents);
        fillActiveChannels(numEvents,activeChannels);
        //扩容
        if(numEvents==events_.size())
        {
            events_.resize(events_.size()*2);
        }
    }
    else if(numEvents==0){
        LOG_DEBUG("%s timeout!\n",__FUNCTION__);
    }
    else{
        if(savedErrno!=EINTR)
        {
            errno=savedErrno;
            LOG_ERROR("EPollPoller::poll() err!");
        }
    }
    return now;
}
// ADD,MOD
//EventLoop包含了channelList 和 Poller
void EpollPoller::updateChannel(Channel *channel)
{
    const int index=channel->index();
    LOG_INFO("func:%s=> fd=%d events=%d index=%d \n",__FUNCTION__,channel->fd(),channel->events(),index);
    if(index==kNew||index==kDeletd)
    {
        if(index==kNew)//未加入过
        {
            int fd=channel->fd();
            channels_[fd]=channel;
        }
        channel->set_index(kAdded);
        update(EPOLL_CTL_ADD,channel);
    }
    else//channel已经在poller上注册过了
    {
        int fd=channel->fd();
        if(channel->isNoneEvent())//对任何事件都不感兴趣了
        {
            update(EPOLL_CTL_DEL,channel);
            channel->set_index(kDeletd);
        }
        else{
            update(EPOLL_CTL_MOD,channel);
        }
    }
}
// DEL                      
void EpollPoller::removeChannel(Channel *channel)
{
    LOG_INFO("func:%s=> fd=%d\n",__FUNCTION__,channel->fd());
    int fd=channel->fd();
    int index=channel->index();

    channels_.erase(fd);
    if(index==kAdded){
        update(EPOLL_CTL_DEL,channel);
    }
    channel->set_index(kNew);
} 
//填写活跃的连接
void EpollPoller::fillActiveChannels(int numEvents,ChannelList*activeChannels)const
{
    for(int i=0;i<numEvents;++i)
    {
        auto channel=static_cast<Channel*>(events_[i].data.ptr);
        channel->set_revents(events_[i].events);
        activeChannels->push_back(channel);//EventLoop拿到了发生事件的
        //channel列表
    }
}
//更新channel通道 epoll_ctl的具体操作
void EpollPoller::update(int operation,Channel*channel)
{
    epoll_event event;
    memset(&event,0,sizeof event);
    
    int fd=channel->fd();
    event.data.fd=fd;
    event.events=channel->events();
    event.data.ptr=channel;
    

    if(::epoll_ctl(epollfd_,operation,fd,&event)<0){
        if(operation==EPOLL_CTL_DEL){
            LOG_ERROR("epoll_ctl del error:%d\n",errno);
        }
        else{
            LOG_FATAL("epoll_ctl add/mod errno:%d\n",errno);
        }
    }
}                 