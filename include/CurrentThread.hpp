#pragma once
//获取线程tid
/*
__builtin_expect是GCC的一个内建函数，用于向编译器提供分支预测信息。这个函数的原型如下：
long __builtin_expect(long exp, long c);

你期望 exp 表达式的值等于常量 c, 看 c 的值, 如果 c 的值为0(即期望的函数返回值), 
那么 执行 if 分支的的可能性小, 否则执行 else 分支的可能性小(函数的返回值等于第一个参数 exp).

GCC在编译过程中，会将可能性更大的代码紧跟着前面的代码，从而减少指令跳转带来的性能上的下降, 达到优化程序的目的.

例子1 : 期望 x == 0, 所以执行func()的可能性小
if (__builtin_expect(x, 0))
{
    func();
}
else
{
　　//do someting
}
例子2 : 期望 ptr !=NULL这个条件成立(1), 所以执行func()的可能性小
if (__builtin_expect(ptr != NULL, 1))
{　　
　　//do something
}
else
{
　　func();
} 
*/
namespace CurrentThread
{
    extern __thread int t_cachedTid;

    void cacheTid();

    inline int tid()
    {
        //__builtin_expect(t_cachedTid==0,0)表示预期t_cachedTid的值不会等于0。
        //如果实际上t_cachedTid的值等于0，那么就会调用cacheTid()函数。这样可以帮助编译器更好地优化代码，提高程序的运行效率。
        if(__builtin_expect(t_cachedTid==0,0))
        {
            cacheTid();
        }
        return t_cachedTid;
    }


};