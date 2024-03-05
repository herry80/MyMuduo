#pragma once
#include<vector>
#include<stdlib.h>
#include<string>
#include<algorithm>
//网络库底层的缓冲器类型
class Buffer
{
public:
    static const size_t kCheapPrepend=8;
    static const size_t kInitialSize=1024;

    explicit Buffer(size_t initiaSize=kInitialSize):
            buffer_(kCheapPrepend+initiaSize),
            readerIndex_(kCheapPrepend),
            writerIndex_(kCheapPrepend)
    {}

    size_t readableBytes()const//可读的数据
    {
        return writerIndex_-readerIndex_;
    }
    size_t writableBytes()const
    {
        return buffer_.size()-writerIndex_;
    }
    size_t prependableBytes()const
    {
        return readerIndex_;
    }

    void retrieve(size_t len)
    {
        if(len<readableBytes())
        {
            readerIndex_+=len;
            //应用只读取了可读缓冲区部分数据，还有readerIndex_+=len=>writerIndex数据未读
        }
        else
        {
            retrieveAll();
        }
    }
    void retrieveAll()
    {
        readerIndex_=writerIndex_=kCheapPrepend;  
    }
    //把onMessage函数上报的BUffer数据转成string类型
    std::string retrieveAllAsString()
    {
        //应用可读取数据的长度
        return retrieveAsString(readableBytes());
    }
    std::string retrieveAsString(size_t len)
    {
        std::string result(peek(),len);
        retrieve(len);//对缓冲区进行复位操作，上面这一句把缓冲区中可读的数据读取了出来
        return result;
    }

    void ensureWriteableBytes(size_t len)
    {
        if(writableBytes()<len)
        {
            makeSpace(len);//扩容函数
        }
    }
    //写数据，将data数据写到可写空间中
    void append(const char* data,size_t len)
    {
        ensureWriteableBytes(len);//确保空间够
        std::copy(data,data+len,beginWrite());
        writerIndex_+=len;
    }

    char* beginWrite()
    {
        return begin()+writerIndex_;
    }
    const char* beginWrite()const
    {
        return begin()+writerIndex_;
    }
    
    //从fd上读取数据
    ssize_t readFd(int fd,int *saveErrno);
    //通过fd发送数据
    ssize_t writeFd(int fd,int *saveErrno);
private:
    char* begin()
    {
        return &(*buffer_.begin());//返回数组的起始地址
    }
    const char* begin()const{
        return &(*buffer_.begin());
    }
    //返回缓冲区中可读数据的起始地址
    const char* peek()const
    {
        return begin()+readerIndex_;
    }

    void makeSpace(size_t len)
    {
        //空闲的空间加上可写的空间都比len小，只能进行resize
        if(writableBytes()+prependableBytes()<len+kCheapPrepend)
        {
            //只能进行resize，直接在writeIndex加上len
            buffer_.resize(writerIndex_+len);
        }
        else
        {
            //空闲的空间加上可写的空间比len大，那么就把可读缓冲区中未读的数据挪到空闲的空间
            //相当于给可写空间增加了空间
            size_t readable=readableBytes();
            std::copy(begin()+readerIndex_,
                    begin()+writerIndex_,
                    begin()+kCheapPrepend);
            readerIndex_=kCheapPrepend;
            writerIndex_=readerIndex_+readable;
        }
    }
    std::vector<char> buffer_;
    size_t readerIndex_;
    size_t writerIndex_;
};