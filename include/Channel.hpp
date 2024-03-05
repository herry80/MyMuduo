#pragma once
#include"nocopyable.hpp"
#include"Timestamp.hpp"

#include<functional>
#include<memory>

class EventLoop;
/*
    Channel 理解为通道，封装了sockfd和其感兴趣的event,如EPOLLIN，EPOLLOUT事件，
    还绑定了poller返回的具体时间
*/

class Channel:nocopyable
{
public:
    using EventCallback=std::function<void()>;
    using ReadEventCallback=std::function<void(Timestamp)>;//只读事件回调

    Channel(EventLoop*loop,int fd); 
    ~Channel();
    //fd得到Poller通知后，处理事件
    void handleEvent(Timestamp receiveTime);
    //设置回调函数参数
    void setReadCallback(ReadEventCallback cb){readCallback_=std::move(cb);}
    void setWriteCallback(EventCallback cb){writeCallback_=std::move(cb);}
    void setCloseCallback(EventCallback cb){closeCallback_=std::move(cb);}
    void setErrorCallback(EventCallback cb){errorCallback_=std::move(cb);}

    //防止当Channel被手动remove掉，channel还在执行回调
    void tie(const std::shared_ptr<void>&);
    //获取相应的成员变量
    int fd()const{return fd_;};
    int events()const {return events_;}
    void set_revents(int revt){revents_=revt;}

    
    //设置fd相应的事件状态
    void enableReading(){events_|= kReadEvent;update();}
    void disableReading(){events_&= ~kReadEvent;update();}
    void enableWriting(){events_|= kWriteEvent;update();}
    void disableWriting(){events_&= ~kWriteEvent;update();}
    void disableAll(){events_ = kNoneEvent;update();}
    //返回fd当前的状态
    bool isNoneEvent()const{return events_==kNoneEvent;}
    bool isWriting()const {return events_&kWriteEvent;}
    bool isReading()const {return events_&kReadEvent;}

    int index(){return index_;}
    void set_index(int idx){index_=idx;}

    EventLoop* ownerLoop(){return loop_;}
    void remove();

private:
    void update();
    void handleEventWithGuard(Timestamp receiveTime);

    static const int kNoneEvent;
    static const int kReadEvent;
    static const int kWriteEvent;

    EventLoop*loop_;//事件循环 该fd属于哪个EventLoop对象
    const int fd_;  //fd Poller监听的对象
    int events_;    //注册fd感兴趣的事件
    int revents_;   //poller返回具体发生的事件
    int index_;     //used by poller

    //Channel能够获知fd最终发生的具体的事件revents_，所以负责调用具体事件的回调
    std::weak_ptr<void> tie_;
    bool tied_;//用于指示Channel是否与某个对象绑定

    ReadEventCallback readCallback_;
    EventCallback writeCallback_;
    EventCallback closeCallback_;
    EventCallback errorCallback_;
    
};