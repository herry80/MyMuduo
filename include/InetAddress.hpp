#pragma once

#include<sys/socket.h>
#include<netinet/in.h>
#include<string>
//封装socket地址类
class InetAddress
{
public:
    explicit InetAddress(uint16_t port=0,std::string ip="127.0.0.1");
    explicit InetAddress(const sockaddr_in& addr):addr_(addr){}

    std::string toIp() const;//获取ip
    std::string toIpPort() const;//获取ip和port
    uint16_t toPort() const;//获取port

    void setSockAddr(const sockaddr_in&addr){addr_=addr;}

    const sockaddr_in* getSockAddr()const {return &addr_;}
private:
    sockaddr_in addr_;
};