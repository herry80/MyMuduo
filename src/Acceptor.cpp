#include "Acceptor.hpp"
#include"logger.hpp"

#include<sys/types.h>
#include<sys/socket.h>
#include<errno.h>
#include<unistd.h>
static int createNonblocking()
{
    int sockfd=::socket(AF_INET,SOCK_STREAM|SOCK_NONBLOCK|SOCK_CLOEXEC,IPPROTO_TCP);
    if(sockfd<0)
    {
        LOG_FATAL("%s:%s:%d listen sockfd create err:%d \n",__FILE__,__FUNCTION__,__LINE__,errno);
    }
    return sockfd;
}
Acceptor::Acceptor(EventLoop *loop, const InetAddress &listenAddr, bool reuseport):
                    loop_(loop),
                    acceptSocket_(createNonblocking()),
                    acceptChannel_(loop,acceptSocket_.fd()),
                    listenning_(false)
                    {
                        acceptSocket_.setResueAddr(true);
                        acceptSocket_.setReusePort(true);
                        acceptSocket_.bindAddress(listenAddr);
                        //绑定一个回调,当有事件发生时，会调用handleRead函数执行
                        acceptChannel_.setReadCallback(std::bind(&Acceptor::handleRead,this));
                    }
Acceptor::~Acceptor()
{
    acceptChannel_.disableAll();
    acceptChannel_.remove();
}
void Acceptor::listen()
{
    listenning_=true;
    acceptSocket_.listen();
    acceptChannel_.enableReading();
}
void Acceptor::handleRead()
{
    InetAddress peerAddr;
    int connfd=acceptSocket_.accept(&peerAddr);
    if(connfd>=0)
    {
        if(newConnectionCallback_)
        {
            newConnectionCallback_(connfd,peerAddr);//轮训找到subloop唤醒，分发当前的新客户端的channel
        }
        else
        {
            ::close(connfd);
        }
    }
    else
    {
        LOG_ERROR("%s:%s:%d accept err:%d \n",__FILE__,__FUNCTION__,__LINE__,errno);
        if(errno==EMFILE)
        {
            LOG_FATAL("%s:%s:%d sockfd reached limit :%d \n",__FILE__,__FUNCTION__,__LINE__,errno);
        }
    }
}