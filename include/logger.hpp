#pragma once
#include<string>

#include"nocopyable.hpp"

//example:LOG_INFO("%s,%d",.....);
#define LOG_INFO(logmsgFormat, ...) \
do \
{ \
    Logger &logger=Logger::instance();\
    logger.setLogLevel(INFO);\
    char buff[1024]={0};\
    snprintf(buff,1024,logmsgFormat,##__VA_ARGS__); \
    logger.log(buff); \
} while (0) 

#define LOG_ERROR(logmsgFormat, ...) \
do \
{ \
    Logger &logger=Logger::instance();\
    logger.setLogLevel(ERROR);\
    char buff[1024]={0};\
    snprintf(buff,1024,logmsgFormat,##__VA_ARGS__); \
    logger.log(buff); \
} while (0) 

#define LOG_FATAL(logmsgFormat, ...) \
do \
{ \
    Logger &logger=Logger::instance();\
    logger.setLogLevel(FATAL);\
    char buff[1024]={0};\
    snprintf(buff,1024,logmsgFormat,##__VA_ARGS__); \
    logger.log(buff); \
    exit(-1); \
} while (0) 

#ifdef MUDEBUG
#define LOG_DEBUG(logmsgFormat, ...) \
do \
{ \
    Logger &logger=Logger::instance();\
    logger.setLogLevel(DEBUG);\
    char buff[1024]={0};\
    snprintf(buff,1024,logmsgFormat,##__VA_ARGS__); \
    logger.log(buff); \
} while (0) 
#else
#define LOG_DEBUG(logmsgFormat, ...)
#endif

//定义日志级别
enum LogLevel
{
    INFO,//普通信息
    ERROR,//错误信息
    FATAL,//core信息
    DEBUG//调试信息
};

//设计一个日志类（单例）
class Logger:nocopyable
{
public:
    //获取日志唯一示例对象
    static Logger& instance();
    //设置日志级别
    void setLogLevel(int Level);
    //写日志
    void log(std::string msg);
private:
    int logLevel_;//日志级别
    Logger(){}
};