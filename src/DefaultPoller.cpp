#include"Poller.hpp"
#include"EpollPoller.hpp"

#include<stdlib.h>
Poller*Poller::newDefualtPoller(EventLoop*loop){
    if(::getenv("MUDUO_USE_POLL"))//就是环境变量设置了MUDUO_USE_POLL的话生成poll对象，没有则默认生成EPOLL实例
    {
        return nullptr;//生成poll的实例
    }
    else{
        return new EpollPoller(loop);//生成epoll的实例
    }
}
//单独放在一个文件而不放在Poller.cpp里，是一种设计，该函数就是为了获取相应的实例，也就是说得加上相应的头文件，比如
//#include"epollpoller.hpp",基类中最好不要包含派生类的头文件。派生类用基类包含基类的头文件，但基类使用派生类最好不要包含派生类的
//头文件，不是一个好的设计，将该函数单独的放在一个.cpp文件里。