#include "Buffer.hpp"
#include<errno.h>
#include<sys/uio.h>
#include<unistd.h>
// 从fd上读取数据 Poller工作在LT模式
//考虑一个问题：Buffer缓冲区是有大小限制的，但是从fd上读数据的时候，却不知道tcp数据最终的大小
ssize_t Buffer::readFd(int fd, int *saveErrno)
{
    char extrabuf[65536]={0};//栈上的内存空间 64k
    struct iovec vec[2];
    const size_t writable=writableBytes();//Buffer缓冲区剩余可写空间的大小
    vec[0].iov_base=begin()+writerIndex_;
    vec[0].iov_len=writable;

    vec[1].iov_base=extrabuf;
    vec[1].iov_len=sizeof extrabuf;

    const int ivocnt=(writable<sizeof extrabuf)?2:1;
    const ssize_t n=::readv(fd,vec,ivocnt);
    if(n<0)
    {
        *saveErrno=errno;
    }
    else if(n<=writable)//Buffer的可写缓冲区够写了
    {
        writerIndex_+=n;
    }
    else//extrabuf里也有数据
    {
        writerIndex_=buffer_.size();
        append(extrabuf,n-writable);
    }
    return n;
}

ssize_t Buffer::writeFd(int fd,int *saveErrno)
{
    ssize_t n=::write(fd,peek(),readableBytes());
    if(n<0)
    {
        *saveErrno=errno;
    }
    return n;
}

/*
当然可以，我会再次总结一下`readv`和`writev`函数的用法。

`readv`函数的原型如下：
```c
#include <sys/uio.h>
ssize_t readv(int fd, const struct iovec *iov, int iovcnt);
```
`writev`函数的原型如下：
```c
#include <sys/uio.h>
ssize_t writev(int fd, const struct iovec *iov, int iovcnt);
```
其中，`fd`是文件描述符，`iov`是指向`iovec`结构数组的一个指针，`iovcnt`指定了`iovec`的个数。`iovec`结构定义如下：
```c
struct iovec {
    void *iov_base;  缓冲区首地址 
    size_t iov_len;  缓冲区长度 
};
```
`readv`函数会按照`iov`数组中的`iovec`结构的顺序，从文件描述符`fd`中读取数据。
`writev`函数则将`iov`描述的数据的`iovcnt`缓冲区写入与文件描述符`fd`相关联的文件。

这两个函数的返回值是读取或写入的总字节数。如果函数调用成功，`writev`返回输出的字节总数，
通常应等于所有缓冲区长度之和。`readv`返回读到的字节总数。如果遇到文件尾端，
已无数据可读，则返回0。如果函数调用失败，返回-1并设置相应的`errno`。

这两个函数的优点是只需一次系统调用就可以实现在文件和进程的多个缓冲区之间传送数据，
免除了多次系统调用或复制数据的开销。这对于需要处理大量数据的应用程序来说，可以提高效率。
例如，网络编程中的数据包发送和接收，文件系统的读写操作等。

需要注意的是，`readv`和`writev`执行的数据传输是原子的：`writev`写入的数据作为单个块写入，
而不是与其他进程中的写入输出混合；类似地，`readv`保证从文件中读取连续的数据块，
而不管在其他线程或进程中执行的读取操作。这些特性使得`readv`和`writev`在并发编程中非常有用。
*/