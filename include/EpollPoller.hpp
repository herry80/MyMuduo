#pragma once
#include"Poller.hpp"

#include<sys/epoll.h>
class EpollPoller:public Poller
{
public:
    EpollPoller(EventLoop *loop);//epoll_create
    ~EpollPoller() override;//close epollfd_
    //重写基类抽象的方法
    Timestamp poll(int timeoutMs,ChannelList*activeChannels)override;//epoll_wait
    void updateChannel(Channel *channel)override;//ADD,MOD
    void removeChannel(Channel *channel)override;//DEL

private:
    static const int kInitEventListSize=16;//初始events的大小
    //static const char* operationToSring(int op);
    //填写活跃的连接
    void fillActiveChannels(int numEvents,ChannelList*activeChannels)const;
    //更新channel通道
    void update(int operation,Channel*channel);

    using EventList=std::vector<struct epoll_event>;
    
    int epollfd_;
    EventList events_;//epoll_wait的返回值
};