#include"CurrentThread.hpp"
#include"unistd.h"
#include<sys/syscall.h>
namespace CurrentThread
{
    __thread int t_cachedTid=0;

    void cacheTid()
    {
        if(t_cachedTid==0)
        {
            //通过linux系统调用，获取当前线程的pid
            t_cachedTid=static_cast<pid_t>(::syscall(SYS_gettid));
        }
    }
};
