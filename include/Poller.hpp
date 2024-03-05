#pragma once
#include<vector>
#include<unordered_map>

#include"nocopyable.hpp"
#include"Channel.hpp"
#include"Timestamp.hpp"

class EventLoop;
//muduo库中多路事件分发器的核心IO复用模块
class Poller:nocopyable
{
public:
    using ChannelList=std::vector<Channel*>;
    Poller(EventLoop*loop);
    virtual ~Poller()=default;
    //给所有io复用保留统一的接口
    virtual Timestamp poll(int timeoutMs,ChannelList* activeChannels)=0;
    virtual void updateChannel(Channel *channel)=0;
    virtual void removeChannel(Channel *channel)=0;
    //判断参数channel是否在当前Poller中
    bool hasChannel(Channel*channel)const;
    //newDefaultPoller函数是Poller类的一个静态成员函数，它的作用是根据系统环境选择poll或者epoll。
    static Poller*newDefualtPoller(EventLoop*loop);
protected:
    //key就是sockfd，value就是sockfd所属的channel通道类型
    using ChannelMap=std::unordered_map<int,Channel*>;
    ChannelMap channels_;// 负责记录文件描述符-->Channel的映射，也帮忙保管所有注册在你这个Poller上的Channel。
private:
    EventLoop *ownerLoop_;//定义Poller所属的事件循环EventLoop
};