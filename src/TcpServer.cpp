#include"TcpServer.hpp"
#include"logger.hpp"
#include"TcpConnection.hpp"

#include<strings.h>
static EventLoop* chechLoopNotNull(EventLoop*loop)
{
    if(loop==nullptr)
    {
        LOG_FATAL("%s:%s:%d mainloop id null! \n",__FILE__,__FUNCTION__,__LINE__);
    }
    return loop;
}

TcpServer::TcpServer(EventLoop*loop,const InetAddress&listenAddr,const std::string&nameArg,Option option)
            :loop_(chechLoopNotNull(loop)),
            ipPort_(listenAddr.toIpPort()),
            name_(nameArg),
            acceptor_(new Acceptor(loop,listenAddr,option==kReusePort)),
            threadPool_(new EventLoopThreadPool(loop,name_)),
            connectionCallback_(),
            messageCallback_(),
            nextConnId_(1),
            started_(0)
{
    //当有新用户连接时，会执行newConnection回调
    acceptor_->setNewConnectionCallback(std::bind(&TcpServer::newConnection,this,
                std::placeholders::_1,std::placeholders::_2));
}

TcpServer::~TcpServer()
{
    for(auto& item:connections_)
    {
        TcpConnectionPtr conn(item.second);
        item.second.reset();
        conn->getLoop()->runInLoop(
            std::bind(&TcpConnection::connectDestroyed,conn)
        );
    }
}

// 设置底层的subloop的个数
void TcpServer::setThreadNum(int numThreads)
{
    threadPool_->setThreadNum(numThreads);
}

// 开启服务监听
void TcpServer::start()
{
    if(started_++==0)//防止一个tcpserver对象被start多次
    {
        threadPool_->start();//启动线程池
        loop_->runInLoop(std::bind(&Acceptor::listen,acceptor_.get()));
    }
    
}
//newConnection应该根据轮询算法选择一个subloop，唤醒subloop，把当前connfd封装成channel
void TcpServer::newConnection(int sockfd,const InetAddress&peerAddr)
{
    //轮询算法，选择一个subloop,来管理channel
    EventLoop*ioLoop=threadPool_->getNextLoop();
    char buf[64]={0};
    snprintf(buf,sizeof buf,"-%s#%d",ipPort_.c_str(),nextConnId_);
    ++nextConnId_;
    std::string connName=name_+buf;

    LOG_INFO("TcpServer::newConnection[%s]-new connection [%s] from %s",name_.c_str(),connName.c_str(),
    peerAddr.toIpPort().c_str());

    //通过sockfd获取其绑定的本机的ip地址和端口信息
    sockaddr_in local;
    bzero(&local,sizeof local);
    socklen_t addrlen=sizeof local;
    if(::getsockname(sockfd,(sockaddr*)&local,&addrlen)<0)
    {
        LOG_ERROR("sockets::getLocalAddr\n");
    }
    InetAddress localAddr(local);

    //创建根据连接成功的sockfd，创建Tcpconnection连接对象
    TcpConnectionPtr conn(new TcpConnection(
        ioLoop,connName,sockfd,localAddr,peerAddr
    ));
    connections_[connName]=conn;
    //TcpServer=>TcpConnetion=>Channel=>Poller=>notify channel调用回调
    conn->setConnectionCallback(connectionCallback_);
    conn->setMessageCallback(messageCallback_);
    conn->setWriteCompleteCallback(writeCompleteCallback_);
    //设置了如何关闭连接的回调
    conn->setCloseCallback(
        std::bind(&TcpServer::removeConnection,this,std::placeholders::_1)
    );
    //直接调用TcpConnection::connectEstablished
    ioLoop->runInLoop(std::bind(&TcpConnection::connectEstablished,conn));

}
void TcpServer::removeConnection(const TcpConnectionPtr&conn)
{
    loop_->runInLoop(
        std::bind(&TcpServer::removeConnectionInLoop,this,conn)
    );
}
void TcpServer::removeConnectionInLoop(const TcpConnectionPtr&conn)
{
    LOG_INFO("TcpServer::removeConnectionInLoop [%s] - connection %s\n",
    name_.c_str(),conn->name().c_str());

    size_t n=connections_.erase(conn->name());
    EventLoop *ioLoop=conn->getLoop();
    ioLoop->queueInLoop(
        std::bind(&TcpConnection::connectDestroyed,conn)
    );
}