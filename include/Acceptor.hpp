#pragma once
#include"nocopyable.hpp"
#include"Channel.hpp"
#include"Socket.hpp"

class Acceptor:nocopyable
{
public:
    using NewConnectionCallback=std::function<void(int sockfd,const InetAddress&)>;

    Acceptor(EventLoop*loop,const InetAddress&listenAddr,bool reuseport);
    ~Acceptor();

    void setNewConnectionCallback(const NewConnectionCallback&cb)
    {newConnectionCallback_=cb;}

    bool listenning()const{return listenning_;}
    void listen();
private:
    void handleRead();

    EventLoop*loop_;//Acceptor用的就是用户定义的那个baseLoop,也称mainLoop
    Socket acceptSocket_;
    Channel acceptChannel_;
    NewConnectionCallback newConnectionCallback_;
    bool listenning_;
};
