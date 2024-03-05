#pragma once

#include<functional>
#include<vector>
#include<atomic>
#include<memory>
#include<mutex>

#include"nocopyable.hpp"
#include"Timestamp.hpp"
#include"CurrentThread.hpp"

class Channel;
class Poller;
//事件循环类，主要有两大模块，Channel 和 Poller(epoll的抽象)
class EventLoop:nocopyable
{
public:
    using Functor=std::function<void()>;

    EventLoop();
    ~EventLoop();
    //开启事件循环
    void loop();
    //退出事件循环
    void quit();
    
    Timestamp pollReturnTime()const{return pollReturnTime_;}

    //在当前loop中执行cb
    void runInLoop(Functor cb);
    //把cb放入队列中，唤醒loop所在的线程，执行cb
    void queueInLoop(Functor cb);

    //唤醒loop所在的线程
    void wakeup();
    //调用的是poller的方法
    void updateChannel(Channel* channel);
    void removeChannel(Channel* channel);
    bool hasChannel(Channel* channel);
    //判断eventloop对象是否在自己的线程里面
    bool isInLoopThread()const{return threadId_==CurrentThread::tid();}

private:
    void handleRead();//wakeup 操作
    void doPendingFunctors();//执行回调


    using ChannelList=std::vector<Channel*>;

    std::atomic_bool looping_;//原子操作布尔值（CAS）
    std::atomic_bool quit_;   //标志退出loop循环
    
    const pid_t threadId_;//记录当前loop所在线程id

    Timestamp pollReturnTime_;//poller返回发生事件的channels的时间点
    std::unique_ptr<Poller> poller_;
    
    int wakeupFd_;//当mainLoop获取一个新用户的channel,通过轮询算法选择一个subloop，通过该成员获取唤醒subloop处理
    std::unique_ptr<Channel> wakeupChannel_;//通过wakeupChannel唤醒loop函数

    ChannelList activeChannels_;//活跃链接
    Channel* currentActiveChannel_;//指向当前正在处理的那个通道
    
    std::atomic_bool callingPendingFunctors_;//标识当前loop是否有需要执行的回调操作
    std::vector<Functor>pendingFunctors_;//存储loop需要执行的所有回调操作
    std::mutex mutex_;//保护pendingFuntors_的线程安全
};