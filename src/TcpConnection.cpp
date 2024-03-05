#include"TcpConnection.hpp"
#include"logger.hpp"
#include"Socket.hpp"
#include"Channel.hpp"
#include<EventLoop.hpp>

#include<functional>
#include<errno.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<string.h>
#include <netinet/tcp.h>
#include<unistd.h>
static EventLoop* chechLoopNotNull(EventLoop*loop)
{
    if(loop==nullptr)
    {
        LOG_FATAL("%s:%s:%d mainloop id null! \n",__FILE__,__FUNCTION__,__LINE__);
    }
    return loop;
}

 TcpConnection::TcpConnection(EventLoop*loop,const std::string &nameArg,int sockfd,const InetAddress&localAddr,const InetAddress& peerAddr):
                loop_(chechLoopNotNull(loop)),
                name_(nameArg),
                state_(kConnecting),
                reading_(true),
                socket_(new Socket(sockfd)),
                channel_(new Channel(loop,sockfd)),
                localAddr_(localAddr),
                peerAddr_(peerAddr),
                highWaterMark_(64*1024*1024)
                {
                    //给channel设置相应的回调
                    channel_->setReadCallback(
                        std::bind(&TcpConnection::handleRead,this,std::placeholders::_1));
                    channel_->setWriteCallback(
                        std::bind(&TcpConnection::handleWrite,this));
                    channel_->setCloseCallback(
                        std::bind(&TcpConnection::handleClose,this));
                    channel_->setErrorCallback(std::bind(&TcpConnection::handleError,this));

                    LOG_INFO("Tcpconnectio::ctor [%s] at fd=%d\n",name_.c_str(),sockfd);
                    socket_->setKeepAlive(true);
                }

 TcpConnection::~TcpConnection()
 {
    LOG_INFO("Tcpconnection::dtor[%s] at fd=%d state=%d \n",name_.c_str(),channel_->fd(),(int)state_);
 }

 void TcpConnection::handleRead(Timestamp receiveTime)
 {
    int savedErrno=0;
    ssize_t n=inputBuffer_.readFd(channel_->fd(),&savedErrno);
    if(n>0)
    {
        //已建立连接的用户，有可读事件发生
        messageCallback_(shared_from_this(),&inputBuffer_,receiveTime);
    }
    else if(n==0)
    {
        handleClose();
    }
    else{
        errno=savedErrno;
        LOG_ERROR("TcpConnection::handleRead");
        handleError();
    }
 }
 void TcpConnection::handleWrite()
 {
    if(channel_->isWriting())
    {
        int savedErrno=0;
        ssize_t n=outputBuffer_.writeFd(channel_->fd(),&savedErrno);
        if(n>0)
        {
            outputBuffer_.retrieve(n);
            if(outputBuffer_.readableBytes()==0)
            {
                channel_->disableWriting();
                if(writeCompleteCallback_)
                {
                    loop_->queueInLoop(std::bind(writeCompleteCallback_,shared_from_this()));
                }
                if(state_==kDisconnecting)
                {
                    shutdownInLoop();
                }
            }
        }
        else{
            LOG_ERROR("TcpConnection::handleWrite\n");
        }
    }
    else{
            LOG_ERROR("TcpConnection fd=%d is down, no more writing\n",channel_->fd());
    }
 }
 void TcpConnection::handleClose()
 {
    LOG_INFO("fd=%d state=%d \n",channel_->fd(),(int)state_);
    setState(kDisconnected);
    channel_->disableAll();

    TcpConnectionPtr guardThis(shared_from_this());
    connectionCallback_(guardThis);

    closeCallback_(guardThis);
 }
 void TcpConnection::handleError()
 {
    int optval;
    socklen_t optlen=sizeof optval;
    int err=0;
    if(::getsockopt(channel_->fd(),SOL_SOCKET,SO_ERROR,&optval,&optlen)<0)
    {
        err=errno;
    }
    else
    {
        err=optval;
    }
    LOG_ERROR("TcpConnection::handleError name:%s -SO_ERROR:%d \n",name_.c_str(),err);
 }

void TcpConnection::sendInloop(const void* message,size_t len)
{
    ssize_t nwrote=0;
    size_t remaining=len;
    bool faultError=false;
    if(state_==kDisconnected)//之前调用该connection的shutdown,不能再继续发送了
    {
        LOG_ERROR("disconnectioned give up writing!");
        return;
    }
    //表示channel_第一次开始写数据，而且缓冲区没有待发送数据
    if(!channel_->isWriting()&&outputBuffer_.readableBytes()==0)
    {
        nwrote=::write(channel_->fd(),message,len);
        if(nwrote>=0)
        {
            remaining=len-nwrote;
            if(remaining==0&&writeCompleteCallback_)
            {
                loop_->queueInLoop(std::bind(writeCompleteCallback_,shared_from_this()));
            }
        }
        else
        {
            nwrote=0;
            if(errno!=EWOULDBLOCK)
            {
                LOG_ERROR("TcpConnection::sendInLoop");
                if(errno==EPIPE||errno==ECONNRESET)
                {
                    faultError=true;
                }
            }
        }
    }
    //当前这一次write,并没有把数据全部发送出去，剩余的数据需要保存到缓冲区中，然后给channel注册epollout事件，
    //poller发现tcp的发送缓冲区有空间，会通知相应的sock-channel，调用handleWrite回到方法
    if(!faultError&&remaining>0)
    {
        //目前发送缓冲区剩余的待发送数据的长度
        size_t oldLen=outputBuffer_.readableBytes();
        if(oldLen+remaining>=highWaterMark_
        &&oldLen<highWaterMark_
        &&highWaterMarkCallback_)
        {
            loop_->queueInLoop(
                std::bind(highWaterMarkCallback_,shared_from_this(),oldLen+remaining));
        }
        outputBuffer_.append((char*)message+nwrote,remaining);
        if(!channel_->isWriting())
        {
            channel_->enableWriting();
        }
    }
}
void TcpConnection::shutdownInLoop()
{
    if(!channel_->isWriting())//说明outputBuffer中的数据全部发送完成
    {
        socket_->shutdownWrite();//关闭写端
    }
}

  //发送数据
 void TcpConnection::send(const std::string &buf)
 {
    if(state_==kConnected)
    {
        if(loop_->isInLoopThread())
        {
            sendInloop(buf.c_str(),buf.size());
        }
        else
        {
            loop_->runInLoop(std::bind(&TcpConnection::sendInloop,this,buf.c_str(),buf.size()));
        }
    }
 }
 // 关闭连接
 void TcpConnection::shutdown()
 {
    if(state_==kConnected)
    {
        setState(kDisconnecting);
        loop_->runInLoop(std::bind(&TcpConnection::shutdownInLoop,this));
    }
 }

 // 连接建立
 void TcpConnection::connectEstablished()
 {
    setState(kConnected);
    channel_->tie(shared_from_this());
    channel_->enableReading();//向poller注册channel的epollin事件
    //新连接建立，执行回调
    connectionCallback_(shared_from_this());
 }
 // 连接销毁
 void TcpConnection::connectDestroyed()
 {
    if(state_==kConnected)
    {
        setState(kDisconnected);
        channel_->disableAll();//把channel的所有感兴趣的事件，从poller中删除 
        connectionCallback_(shared_from_this());
    }
    channel_->remove();
 }