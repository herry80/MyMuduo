#pragma once
//仿写boost库里的nocopyable类
//目的：派生类可以进行正常的构造和析构，但是必能拷贝构造和拷贝赋值。
class nocopyable
{
public:
    nocopyable(const nocopyable&)=delete;
    nocopyable& operator=(const nocopyable&)=delete;
protected:
    nocopyable()=default;
    ~nocopyable()=default;
};