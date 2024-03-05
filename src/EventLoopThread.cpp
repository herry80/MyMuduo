#include"EventLoopThread.hpp"
#include"EventLoop.hpp"
EventLoopThread::EventLoopThread(const ThreadInitCallback &cb,
                const std::string &name):
                loop_(nullptr),
                exiting_(false),
                thread_(std::bind(&EventLoopThread::threadFunc,this),name),
                mutex_(),
                cond_(),
                callback_(cb)
                {}
EventLoopThread::~EventLoopThread()
{
    exiting_=true;
    if(loop_!=nullptr){
        loop_->quit();
        thread_.join();
    }
}

EventLoop *EventLoopThread::startLoop()
{
    thread_.start();//启动一个新线程，执行的线程函数就是threadFunc

    EventLoop *loop=nullptr;
    {
        std::unique_lock<std::mutex> lock(mutex_);
        cond_.wait(lock,[&]()->bool{return loop_!=nullptr;});
        loop=loop_;
    }
    return loop;
}
//新线程函数
void EventLoopThread::threadFunc()
{
    EventLoop loop;//创建一个独立的eventloop，和上面的线程是一一对应的。
    if(callback_)
    {
        callback_(&loop);
    }
    {
        std::unique_lock<std::mutex> lock(mutex_);
        loop_=&loop;
        cond_.notify_one();
    }
    loop.loop();//EventLoop=>loop()
    std::unique_lock<std::mutex> lock(mutex_);
    loop_=nullptr;//因为loop是局部对象，函数结束后为了避免其他地方使用已经析构的Eventloop对象，所以得置为空
}