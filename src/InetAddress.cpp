#include "InetAddress.hpp"
#include<arpa/inet.h>
#include<string.h>
#include<strings.h>
InetAddress::InetAddress(uint16_t port, std::string ip) 
{
    //memset(&addr_,0,sizeof(addr_));
    bzero(&addr_,sizeof addr_);
    addr_.sin_family=AF_INET;
    addr_.sin_port=htons(port);
    addr_.sin_addr.s_addr=inet_addr(ip.c_str());
}
// 获取ip
std::string InetAddress::toIp() const
{
    char buff[64]={0};
    //将数值格式转化为点分十进制的ip地址格式
    ::inet_ntop(AF_INET,&addr_.sin_addr,buff,sizeof(buff));
    return buff;
}  
 // 获取ip和port   
std::string InetAddress::toIpPort() const
{
    //ip:port
    char buff[64]={0};
    //将数值格式转化为点分十进制的ip地址格式
    ::inet_ntop(AF_INET,&addr_.sin_addr,buff,sizeof(buff));
    size_t end=strlen(buff);
    uint16_t port=ntohs(addr_.sin_port);
    sprintf(buff+end,":%u",port);
    return buff;
}
 // 获取port
uint16_t InetAddress::toPort() const
{
    uint16_t port=ntohs(addr_.sin_port);
    return port;
}   