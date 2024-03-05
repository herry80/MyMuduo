#include<iostream>
#include<string>
#include<functional>

#include"TcpServer.hpp"
using namespace std;

class server
{
public:
    server(EventLoop*loop,const InetAddress&addr,const std::string&name):
        server_(loop,addr,name),
        loop_(loop)
        {
            server_.setConnectionCallback(std::bind(&server::onConnection,this,std::placeholders::_1));
            server_.setMessageCallback(std::bind(&server::onMessage,this,std::placeholders::_1,std::placeholders::_2,
            std::placeholders::_3));
            server_.setThreadNum(3);
        }
        void start()
        {
            server_.start();
        }
private:
    void onConnection(const TcpConnectionPtr&conn)
    {
        if(conn->connected())
        {
            std::cout<<"Connection UP:"<<conn->PerrAddress().toIpPort()<<std::endl;
        }
        else
        {
            std::cout<<"Connection DOWN:"<<conn->PerrAddress().toIpPort()<<std::endl;
            conn->shutdown();
        }
    }
    void onMessage(const TcpConnectionPtr&conn,Buffer*buf,
                    Timestamp time)
    {
        std::string msg=buf->retrieveAllAsString();
        conn->send(msg);
        //conn->shutdown();
    }
    EventLoop *loop_;
    TcpServer server_;
};
int main()
{
    EventLoop loop;
    InetAddress addr(6000);
    server ser(&loop,addr,"ChatServer");
    ser.start();
    loop.loop();
    return 0;
}