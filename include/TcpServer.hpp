#pragma once
#include"nocopyable.hpp"

#include"EventLoop.hpp"
#include"Acceptor.hpp"
#include"InetAddress.hpp"
#include"Channel.hpp"
#include"EventLoopThreadPool.hpp"
#include"Callbacks.hpp"
#include"TcpConnection.hpp"
#include"Timestamp.hpp"

#include<functional>
#include<memory>
#include<string>
#include<atomic>
#include<unordered_map>

class TcpConnection;
//对外服务器编程使用的类
class TcpServer:nocopyable
{
public:
    using ThreadInitCallback=std::function<void(EventLoop*)>;

    enum Option
    {
        kNoReusePort,
        kReusePort,
    };
    
    TcpServer(EventLoop*loop,const InetAddress&listenAddr,const std::string&nameArg,Option option=kNoReusePort);
    ~TcpServer();

    void setThreadInitcallback(const ThreadInitCallback&cb){threadInitCallback_=cb;}
    void setConnectionCallback(const ConnectionCallback&cb){connectionCallback_=cb;}
    void setMessageCallback(const MessageCallback&cb){messageCallback_=cb;}
    void setWriteCompleteCallback(const WriteCompleteCallback&cb){writeCompleteCallback_=cb;}

    //设置底层的subloop的个数
    void setThreadNum(int numThreads);

    //开启服务监听
    void start();
private:
    void newConnection(int sockfd,const InetAddress&peerAddr);
    void removeConnection(const TcpConnectionPtr&conn);
    void removeConnectionInLoop(const TcpConnectionPtr&conn);

    using ConnectionMap=std::unordered_map<std::string,TcpConnectionPtr>;

    EventLoop* loop_;//the acceptor loop,也就是baseloop，用户定义的loop
    const std::string ipPort_;
    const std::string name_;
    std::unique_ptr<Acceptor>acceptor_;//运行在mainloop,任务是监听新连接事件
    std::shared_ptr<EventLoopThreadPool> threadPool_;

    ConnectionCallback connectionCallback_;//有新连接时的回调
    MessageCallback messageCallback_;//有读写消息的回调
    WriteCompleteCallback writeCompleteCallback_;//消息发送完成以后的回调

    ThreadInitCallback threadInitCallback_;//loop线程初始化的回调
    std::atomic_int started_;

    int nextConnId_;
    ConnectionMap connections_;//保存所有的连接
};