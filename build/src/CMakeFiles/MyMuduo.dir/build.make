# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/My/Desktop/project/MyMuduo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/My/Desktop/project/MyMuduo/build

# Include any dependencies generated for this target.
include src/CMakeFiles/MyMuduo.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/CMakeFiles/MyMuduo.dir/compiler_depend.make

# Include the progress variables for this target.
include src/CMakeFiles/MyMuduo.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/MyMuduo.dir/flags.make

src/CMakeFiles/MyMuduo.dir/Acceptor.cpp.o: src/CMakeFiles/MyMuduo.dir/flags.make
src/CMakeFiles/MyMuduo.dir/Acceptor.cpp.o: ../src/Acceptor.cpp
src/CMakeFiles/MyMuduo.dir/Acceptor.cpp.o: src/CMakeFiles/MyMuduo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/My/Desktop/project/MyMuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/MyMuduo.dir/Acceptor.cpp.o"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/MyMuduo.dir/Acceptor.cpp.o -MF CMakeFiles/MyMuduo.dir/Acceptor.cpp.o.d -o CMakeFiles/MyMuduo.dir/Acceptor.cpp.o -c /home/My/Desktop/project/MyMuduo/src/Acceptor.cpp

src/CMakeFiles/MyMuduo.dir/Acceptor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MyMuduo.dir/Acceptor.cpp.i"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/My/Desktop/project/MyMuduo/src/Acceptor.cpp > CMakeFiles/MyMuduo.dir/Acceptor.cpp.i

src/CMakeFiles/MyMuduo.dir/Acceptor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MyMuduo.dir/Acceptor.cpp.s"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/My/Desktop/project/MyMuduo/src/Acceptor.cpp -o CMakeFiles/MyMuduo.dir/Acceptor.cpp.s

src/CMakeFiles/MyMuduo.dir/Buffer.cpp.o: src/CMakeFiles/MyMuduo.dir/flags.make
src/CMakeFiles/MyMuduo.dir/Buffer.cpp.o: ../src/Buffer.cpp
src/CMakeFiles/MyMuduo.dir/Buffer.cpp.o: src/CMakeFiles/MyMuduo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/My/Desktop/project/MyMuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/CMakeFiles/MyMuduo.dir/Buffer.cpp.o"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/MyMuduo.dir/Buffer.cpp.o -MF CMakeFiles/MyMuduo.dir/Buffer.cpp.o.d -o CMakeFiles/MyMuduo.dir/Buffer.cpp.o -c /home/My/Desktop/project/MyMuduo/src/Buffer.cpp

src/CMakeFiles/MyMuduo.dir/Buffer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MyMuduo.dir/Buffer.cpp.i"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/My/Desktop/project/MyMuduo/src/Buffer.cpp > CMakeFiles/MyMuduo.dir/Buffer.cpp.i

src/CMakeFiles/MyMuduo.dir/Buffer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MyMuduo.dir/Buffer.cpp.s"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/My/Desktop/project/MyMuduo/src/Buffer.cpp -o CMakeFiles/MyMuduo.dir/Buffer.cpp.s

src/CMakeFiles/MyMuduo.dir/Channel.cpp.o: src/CMakeFiles/MyMuduo.dir/flags.make
src/CMakeFiles/MyMuduo.dir/Channel.cpp.o: ../src/Channel.cpp
src/CMakeFiles/MyMuduo.dir/Channel.cpp.o: src/CMakeFiles/MyMuduo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/My/Desktop/project/MyMuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/CMakeFiles/MyMuduo.dir/Channel.cpp.o"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/MyMuduo.dir/Channel.cpp.o -MF CMakeFiles/MyMuduo.dir/Channel.cpp.o.d -o CMakeFiles/MyMuduo.dir/Channel.cpp.o -c /home/My/Desktop/project/MyMuduo/src/Channel.cpp

src/CMakeFiles/MyMuduo.dir/Channel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MyMuduo.dir/Channel.cpp.i"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/My/Desktop/project/MyMuduo/src/Channel.cpp > CMakeFiles/MyMuduo.dir/Channel.cpp.i

src/CMakeFiles/MyMuduo.dir/Channel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MyMuduo.dir/Channel.cpp.s"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/My/Desktop/project/MyMuduo/src/Channel.cpp -o CMakeFiles/MyMuduo.dir/Channel.cpp.s

src/CMakeFiles/MyMuduo.dir/CurrentThread.cpp.o: src/CMakeFiles/MyMuduo.dir/flags.make
src/CMakeFiles/MyMuduo.dir/CurrentThread.cpp.o: ../src/CurrentThread.cpp
src/CMakeFiles/MyMuduo.dir/CurrentThread.cpp.o: src/CMakeFiles/MyMuduo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/My/Desktop/project/MyMuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/CMakeFiles/MyMuduo.dir/CurrentThread.cpp.o"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/MyMuduo.dir/CurrentThread.cpp.o -MF CMakeFiles/MyMuduo.dir/CurrentThread.cpp.o.d -o CMakeFiles/MyMuduo.dir/CurrentThread.cpp.o -c /home/My/Desktop/project/MyMuduo/src/CurrentThread.cpp

src/CMakeFiles/MyMuduo.dir/CurrentThread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MyMuduo.dir/CurrentThread.cpp.i"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/My/Desktop/project/MyMuduo/src/CurrentThread.cpp > CMakeFiles/MyMuduo.dir/CurrentThread.cpp.i

src/CMakeFiles/MyMuduo.dir/CurrentThread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MyMuduo.dir/CurrentThread.cpp.s"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/My/Desktop/project/MyMuduo/src/CurrentThread.cpp -o CMakeFiles/MyMuduo.dir/CurrentThread.cpp.s

src/CMakeFiles/MyMuduo.dir/DefaultPoller.cpp.o: src/CMakeFiles/MyMuduo.dir/flags.make
src/CMakeFiles/MyMuduo.dir/DefaultPoller.cpp.o: ../src/DefaultPoller.cpp
src/CMakeFiles/MyMuduo.dir/DefaultPoller.cpp.o: src/CMakeFiles/MyMuduo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/My/Desktop/project/MyMuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/CMakeFiles/MyMuduo.dir/DefaultPoller.cpp.o"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/MyMuduo.dir/DefaultPoller.cpp.o -MF CMakeFiles/MyMuduo.dir/DefaultPoller.cpp.o.d -o CMakeFiles/MyMuduo.dir/DefaultPoller.cpp.o -c /home/My/Desktop/project/MyMuduo/src/DefaultPoller.cpp

src/CMakeFiles/MyMuduo.dir/DefaultPoller.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MyMuduo.dir/DefaultPoller.cpp.i"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/My/Desktop/project/MyMuduo/src/DefaultPoller.cpp > CMakeFiles/MyMuduo.dir/DefaultPoller.cpp.i

src/CMakeFiles/MyMuduo.dir/DefaultPoller.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MyMuduo.dir/DefaultPoller.cpp.s"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/My/Desktop/project/MyMuduo/src/DefaultPoller.cpp -o CMakeFiles/MyMuduo.dir/DefaultPoller.cpp.s

src/CMakeFiles/MyMuduo.dir/EpollPoller.cpp.o: src/CMakeFiles/MyMuduo.dir/flags.make
src/CMakeFiles/MyMuduo.dir/EpollPoller.cpp.o: ../src/EpollPoller.cpp
src/CMakeFiles/MyMuduo.dir/EpollPoller.cpp.o: src/CMakeFiles/MyMuduo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/My/Desktop/project/MyMuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/CMakeFiles/MyMuduo.dir/EpollPoller.cpp.o"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/MyMuduo.dir/EpollPoller.cpp.o -MF CMakeFiles/MyMuduo.dir/EpollPoller.cpp.o.d -o CMakeFiles/MyMuduo.dir/EpollPoller.cpp.o -c /home/My/Desktop/project/MyMuduo/src/EpollPoller.cpp

src/CMakeFiles/MyMuduo.dir/EpollPoller.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MyMuduo.dir/EpollPoller.cpp.i"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/My/Desktop/project/MyMuduo/src/EpollPoller.cpp > CMakeFiles/MyMuduo.dir/EpollPoller.cpp.i

src/CMakeFiles/MyMuduo.dir/EpollPoller.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MyMuduo.dir/EpollPoller.cpp.s"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/My/Desktop/project/MyMuduo/src/EpollPoller.cpp -o CMakeFiles/MyMuduo.dir/EpollPoller.cpp.s

src/CMakeFiles/MyMuduo.dir/EventLoop.cpp.o: src/CMakeFiles/MyMuduo.dir/flags.make
src/CMakeFiles/MyMuduo.dir/EventLoop.cpp.o: ../src/EventLoop.cpp
src/CMakeFiles/MyMuduo.dir/EventLoop.cpp.o: src/CMakeFiles/MyMuduo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/My/Desktop/project/MyMuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object src/CMakeFiles/MyMuduo.dir/EventLoop.cpp.o"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/MyMuduo.dir/EventLoop.cpp.o -MF CMakeFiles/MyMuduo.dir/EventLoop.cpp.o.d -o CMakeFiles/MyMuduo.dir/EventLoop.cpp.o -c /home/My/Desktop/project/MyMuduo/src/EventLoop.cpp

src/CMakeFiles/MyMuduo.dir/EventLoop.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MyMuduo.dir/EventLoop.cpp.i"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/My/Desktop/project/MyMuduo/src/EventLoop.cpp > CMakeFiles/MyMuduo.dir/EventLoop.cpp.i

src/CMakeFiles/MyMuduo.dir/EventLoop.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MyMuduo.dir/EventLoop.cpp.s"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/My/Desktop/project/MyMuduo/src/EventLoop.cpp -o CMakeFiles/MyMuduo.dir/EventLoop.cpp.s

src/CMakeFiles/MyMuduo.dir/EventLoopThread.cpp.o: src/CMakeFiles/MyMuduo.dir/flags.make
src/CMakeFiles/MyMuduo.dir/EventLoopThread.cpp.o: ../src/EventLoopThread.cpp
src/CMakeFiles/MyMuduo.dir/EventLoopThread.cpp.o: src/CMakeFiles/MyMuduo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/My/Desktop/project/MyMuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object src/CMakeFiles/MyMuduo.dir/EventLoopThread.cpp.o"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/MyMuduo.dir/EventLoopThread.cpp.o -MF CMakeFiles/MyMuduo.dir/EventLoopThread.cpp.o.d -o CMakeFiles/MyMuduo.dir/EventLoopThread.cpp.o -c /home/My/Desktop/project/MyMuduo/src/EventLoopThread.cpp

src/CMakeFiles/MyMuduo.dir/EventLoopThread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MyMuduo.dir/EventLoopThread.cpp.i"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/My/Desktop/project/MyMuduo/src/EventLoopThread.cpp > CMakeFiles/MyMuduo.dir/EventLoopThread.cpp.i

src/CMakeFiles/MyMuduo.dir/EventLoopThread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MyMuduo.dir/EventLoopThread.cpp.s"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/My/Desktop/project/MyMuduo/src/EventLoopThread.cpp -o CMakeFiles/MyMuduo.dir/EventLoopThread.cpp.s

src/CMakeFiles/MyMuduo.dir/EventLoopThreadPool.cpp.o: src/CMakeFiles/MyMuduo.dir/flags.make
src/CMakeFiles/MyMuduo.dir/EventLoopThreadPool.cpp.o: ../src/EventLoopThreadPool.cpp
src/CMakeFiles/MyMuduo.dir/EventLoopThreadPool.cpp.o: src/CMakeFiles/MyMuduo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/My/Desktop/project/MyMuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object src/CMakeFiles/MyMuduo.dir/EventLoopThreadPool.cpp.o"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/MyMuduo.dir/EventLoopThreadPool.cpp.o -MF CMakeFiles/MyMuduo.dir/EventLoopThreadPool.cpp.o.d -o CMakeFiles/MyMuduo.dir/EventLoopThreadPool.cpp.o -c /home/My/Desktop/project/MyMuduo/src/EventLoopThreadPool.cpp

src/CMakeFiles/MyMuduo.dir/EventLoopThreadPool.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MyMuduo.dir/EventLoopThreadPool.cpp.i"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/My/Desktop/project/MyMuduo/src/EventLoopThreadPool.cpp > CMakeFiles/MyMuduo.dir/EventLoopThreadPool.cpp.i

src/CMakeFiles/MyMuduo.dir/EventLoopThreadPool.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MyMuduo.dir/EventLoopThreadPool.cpp.s"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/My/Desktop/project/MyMuduo/src/EventLoopThreadPool.cpp -o CMakeFiles/MyMuduo.dir/EventLoopThreadPool.cpp.s

src/CMakeFiles/MyMuduo.dir/InetAddress.cpp.o: src/CMakeFiles/MyMuduo.dir/flags.make
src/CMakeFiles/MyMuduo.dir/InetAddress.cpp.o: ../src/InetAddress.cpp
src/CMakeFiles/MyMuduo.dir/InetAddress.cpp.o: src/CMakeFiles/MyMuduo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/My/Desktop/project/MyMuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object src/CMakeFiles/MyMuduo.dir/InetAddress.cpp.o"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/MyMuduo.dir/InetAddress.cpp.o -MF CMakeFiles/MyMuduo.dir/InetAddress.cpp.o.d -o CMakeFiles/MyMuduo.dir/InetAddress.cpp.o -c /home/My/Desktop/project/MyMuduo/src/InetAddress.cpp

src/CMakeFiles/MyMuduo.dir/InetAddress.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MyMuduo.dir/InetAddress.cpp.i"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/My/Desktop/project/MyMuduo/src/InetAddress.cpp > CMakeFiles/MyMuduo.dir/InetAddress.cpp.i

src/CMakeFiles/MyMuduo.dir/InetAddress.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MyMuduo.dir/InetAddress.cpp.s"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/My/Desktop/project/MyMuduo/src/InetAddress.cpp -o CMakeFiles/MyMuduo.dir/InetAddress.cpp.s

src/CMakeFiles/MyMuduo.dir/Poller.cpp.o: src/CMakeFiles/MyMuduo.dir/flags.make
src/CMakeFiles/MyMuduo.dir/Poller.cpp.o: ../src/Poller.cpp
src/CMakeFiles/MyMuduo.dir/Poller.cpp.o: src/CMakeFiles/MyMuduo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/My/Desktop/project/MyMuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object src/CMakeFiles/MyMuduo.dir/Poller.cpp.o"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/MyMuduo.dir/Poller.cpp.o -MF CMakeFiles/MyMuduo.dir/Poller.cpp.o.d -o CMakeFiles/MyMuduo.dir/Poller.cpp.o -c /home/My/Desktop/project/MyMuduo/src/Poller.cpp

src/CMakeFiles/MyMuduo.dir/Poller.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MyMuduo.dir/Poller.cpp.i"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/My/Desktop/project/MyMuduo/src/Poller.cpp > CMakeFiles/MyMuduo.dir/Poller.cpp.i

src/CMakeFiles/MyMuduo.dir/Poller.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MyMuduo.dir/Poller.cpp.s"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/My/Desktop/project/MyMuduo/src/Poller.cpp -o CMakeFiles/MyMuduo.dir/Poller.cpp.s

src/CMakeFiles/MyMuduo.dir/Socket.cpp.o: src/CMakeFiles/MyMuduo.dir/flags.make
src/CMakeFiles/MyMuduo.dir/Socket.cpp.o: ../src/Socket.cpp
src/CMakeFiles/MyMuduo.dir/Socket.cpp.o: src/CMakeFiles/MyMuduo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/My/Desktop/project/MyMuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object src/CMakeFiles/MyMuduo.dir/Socket.cpp.o"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/MyMuduo.dir/Socket.cpp.o -MF CMakeFiles/MyMuduo.dir/Socket.cpp.o.d -o CMakeFiles/MyMuduo.dir/Socket.cpp.o -c /home/My/Desktop/project/MyMuduo/src/Socket.cpp

src/CMakeFiles/MyMuduo.dir/Socket.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MyMuduo.dir/Socket.cpp.i"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/My/Desktop/project/MyMuduo/src/Socket.cpp > CMakeFiles/MyMuduo.dir/Socket.cpp.i

src/CMakeFiles/MyMuduo.dir/Socket.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MyMuduo.dir/Socket.cpp.s"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/My/Desktop/project/MyMuduo/src/Socket.cpp -o CMakeFiles/MyMuduo.dir/Socket.cpp.s

src/CMakeFiles/MyMuduo.dir/TcpConnection.cpp.o: src/CMakeFiles/MyMuduo.dir/flags.make
src/CMakeFiles/MyMuduo.dir/TcpConnection.cpp.o: ../src/TcpConnection.cpp
src/CMakeFiles/MyMuduo.dir/TcpConnection.cpp.o: src/CMakeFiles/MyMuduo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/My/Desktop/project/MyMuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object src/CMakeFiles/MyMuduo.dir/TcpConnection.cpp.o"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/MyMuduo.dir/TcpConnection.cpp.o -MF CMakeFiles/MyMuduo.dir/TcpConnection.cpp.o.d -o CMakeFiles/MyMuduo.dir/TcpConnection.cpp.o -c /home/My/Desktop/project/MyMuduo/src/TcpConnection.cpp

src/CMakeFiles/MyMuduo.dir/TcpConnection.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MyMuduo.dir/TcpConnection.cpp.i"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/My/Desktop/project/MyMuduo/src/TcpConnection.cpp > CMakeFiles/MyMuduo.dir/TcpConnection.cpp.i

src/CMakeFiles/MyMuduo.dir/TcpConnection.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MyMuduo.dir/TcpConnection.cpp.s"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/My/Desktop/project/MyMuduo/src/TcpConnection.cpp -o CMakeFiles/MyMuduo.dir/TcpConnection.cpp.s

src/CMakeFiles/MyMuduo.dir/TcpServer.cpp.o: src/CMakeFiles/MyMuduo.dir/flags.make
src/CMakeFiles/MyMuduo.dir/TcpServer.cpp.o: ../src/TcpServer.cpp
src/CMakeFiles/MyMuduo.dir/TcpServer.cpp.o: src/CMakeFiles/MyMuduo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/My/Desktop/project/MyMuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object src/CMakeFiles/MyMuduo.dir/TcpServer.cpp.o"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/MyMuduo.dir/TcpServer.cpp.o -MF CMakeFiles/MyMuduo.dir/TcpServer.cpp.o.d -o CMakeFiles/MyMuduo.dir/TcpServer.cpp.o -c /home/My/Desktop/project/MyMuduo/src/TcpServer.cpp

src/CMakeFiles/MyMuduo.dir/TcpServer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MyMuduo.dir/TcpServer.cpp.i"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/My/Desktop/project/MyMuduo/src/TcpServer.cpp > CMakeFiles/MyMuduo.dir/TcpServer.cpp.i

src/CMakeFiles/MyMuduo.dir/TcpServer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MyMuduo.dir/TcpServer.cpp.s"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/My/Desktop/project/MyMuduo/src/TcpServer.cpp -o CMakeFiles/MyMuduo.dir/TcpServer.cpp.s

src/CMakeFiles/MyMuduo.dir/Thread.cpp.o: src/CMakeFiles/MyMuduo.dir/flags.make
src/CMakeFiles/MyMuduo.dir/Thread.cpp.o: ../src/Thread.cpp
src/CMakeFiles/MyMuduo.dir/Thread.cpp.o: src/CMakeFiles/MyMuduo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/My/Desktop/project/MyMuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building CXX object src/CMakeFiles/MyMuduo.dir/Thread.cpp.o"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/MyMuduo.dir/Thread.cpp.o -MF CMakeFiles/MyMuduo.dir/Thread.cpp.o.d -o CMakeFiles/MyMuduo.dir/Thread.cpp.o -c /home/My/Desktop/project/MyMuduo/src/Thread.cpp

src/CMakeFiles/MyMuduo.dir/Thread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MyMuduo.dir/Thread.cpp.i"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/My/Desktop/project/MyMuduo/src/Thread.cpp > CMakeFiles/MyMuduo.dir/Thread.cpp.i

src/CMakeFiles/MyMuduo.dir/Thread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MyMuduo.dir/Thread.cpp.s"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/My/Desktop/project/MyMuduo/src/Thread.cpp -o CMakeFiles/MyMuduo.dir/Thread.cpp.s

src/CMakeFiles/MyMuduo.dir/Timestamp.cpp.o: src/CMakeFiles/MyMuduo.dir/flags.make
src/CMakeFiles/MyMuduo.dir/Timestamp.cpp.o: ../src/Timestamp.cpp
src/CMakeFiles/MyMuduo.dir/Timestamp.cpp.o: src/CMakeFiles/MyMuduo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/My/Desktop/project/MyMuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building CXX object src/CMakeFiles/MyMuduo.dir/Timestamp.cpp.o"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/MyMuduo.dir/Timestamp.cpp.o -MF CMakeFiles/MyMuduo.dir/Timestamp.cpp.o.d -o CMakeFiles/MyMuduo.dir/Timestamp.cpp.o -c /home/My/Desktop/project/MyMuduo/src/Timestamp.cpp

src/CMakeFiles/MyMuduo.dir/Timestamp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MyMuduo.dir/Timestamp.cpp.i"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/My/Desktop/project/MyMuduo/src/Timestamp.cpp > CMakeFiles/MyMuduo.dir/Timestamp.cpp.i

src/CMakeFiles/MyMuduo.dir/Timestamp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MyMuduo.dir/Timestamp.cpp.s"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/My/Desktop/project/MyMuduo/src/Timestamp.cpp -o CMakeFiles/MyMuduo.dir/Timestamp.cpp.s

src/CMakeFiles/MyMuduo.dir/logger.cpp.o: src/CMakeFiles/MyMuduo.dir/flags.make
src/CMakeFiles/MyMuduo.dir/logger.cpp.o: ../src/logger.cpp
src/CMakeFiles/MyMuduo.dir/logger.cpp.o: src/CMakeFiles/MyMuduo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/My/Desktop/project/MyMuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Building CXX object src/CMakeFiles/MyMuduo.dir/logger.cpp.o"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/MyMuduo.dir/logger.cpp.o -MF CMakeFiles/MyMuduo.dir/logger.cpp.o.d -o CMakeFiles/MyMuduo.dir/logger.cpp.o -c /home/My/Desktop/project/MyMuduo/src/logger.cpp

src/CMakeFiles/MyMuduo.dir/logger.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MyMuduo.dir/logger.cpp.i"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/My/Desktop/project/MyMuduo/src/logger.cpp > CMakeFiles/MyMuduo.dir/logger.cpp.i

src/CMakeFiles/MyMuduo.dir/logger.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MyMuduo.dir/logger.cpp.s"
	cd /home/My/Desktop/project/MyMuduo/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/My/Desktop/project/MyMuduo/src/logger.cpp -o CMakeFiles/MyMuduo.dir/logger.cpp.s

# Object files for target MyMuduo
MyMuduo_OBJECTS = \
"CMakeFiles/MyMuduo.dir/Acceptor.cpp.o" \
"CMakeFiles/MyMuduo.dir/Buffer.cpp.o" \
"CMakeFiles/MyMuduo.dir/Channel.cpp.o" \
"CMakeFiles/MyMuduo.dir/CurrentThread.cpp.o" \
"CMakeFiles/MyMuduo.dir/DefaultPoller.cpp.o" \
"CMakeFiles/MyMuduo.dir/EpollPoller.cpp.o" \
"CMakeFiles/MyMuduo.dir/EventLoop.cpp.o" \
"CMakeFiles/MyMuduo.dir/EventLoopThread.cpp.o" \
"CMakeFiles/MyMuduo.dir/EventLoopThreadPool.cpp.o" \
"CMakeFiles/MyMuduo.dir/InetAddress.cpp.o" \
"CMakeFiles/MyMuduo.dir/Poller.cpp.o" \
"CMakeFiles/MyMuduo.dir/Socket.cpp.o" \
"CMakeFiles/MyMuduo.dir/TcpConnection.cpp.o" \
"CMakeFiles/MyMuduo.dir/TcpServer.cpp.o" \
"CMakeFiles/MyMuduo.dir/Thread.cpp.o" \
"CMakeFiles/MyMuduo.dir/Timestamp.cpp.o" \
"CMakeFiles/MyMuduo.dir/logger.cpp.o"

# External object files for target MyMuduo
MyMuduo_EXTERNAL_OBJECTS =

../lib/libMyMuduo.so: src/CMakeFiles/MyMuduo.dir/Acceptor.cpp.o
../lib/libMyMuduo.so: src/CMakeFiles/MyMuduo.dir/Buffer.cpp.o
../lib/libMyMuduo.so: src/CMakeFiles/MyMuduo.dir/Channel.cpp.o
../lib/libMyMuduo.so: src/CMakeFiles/MyMuduo.dir/CurrentThread.cpp.o
../lib/libMyMuduo.so: src/CMakeFiles/MyMuduo.dir/DefaultPoller.cpp.o
../lib/libMyMuduo.so: src/CMakeFiles/MyMuduo.dir/EpollPoller.cpp.o
../lib/libMyMuduo.so: src/CMakeFiles/MyMuduo.dir/EventLoop.cpp.o
../lib/libMyMuduo.so: src/CMakeFiles/MyMuduo.dir/EventLoopThread.cpp.o
../lib/libMyMuduo.so: src/CMakeFiles/MyMuduo.dir/EventLoopThreadPool.cpp.o
../lib/libMyMuduo.so: src/CMakeFiles/MyMuduo.dir/InetAddress.cpp.o
../lib/libMyMuduo.so: src/CMakeFiles/MyMuduo.dir/Poller.cpp.o
../lib/libMyMuduo.so: src/CMakeFiles/MyMuduo.dir/Socket.cpp.o
../lib/libMyMuduo.so: src/CMakeFiles/MyMuduo.dir/TcpConnection.cpp.o
../lib/libMyMuduo.so: src/CMakeFiles/MyMuduo.dir/TcpServer.cpp.o
../lib/libMyMuduo.so: src/CMakeFiles/MyMuduo.dir/Thread.cpp.o
../lib/libMyMuduo.so: src/CMakeFiles/MyMuduo.dir/Timestamp.cpp.o
../lib/libMyMuduo.so: src/CMakeFiles/MyMuduo.dir/logger.cpp.o
../lib/libMyMuduo.so: src/CMakeFiles/MyMuduo.dir/build.make
../lib/libMyMuduo.so: src/CMakeFiles/MyMuduo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/My/Desktop/project/MyMuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_18) "Linking CXX shared library ../../lib/libMyMuduo.so"
	cd /home/My/Desktop/project/MyMuduo/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MyMuduo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/MyMuduo.dir/build: ../lib/libMyMuduo.so
.PHONY : src/CMakeFiles/MyMuduo.dir/build

src/CMakeFiles/MyMuduo.dir/clean:
	cd /home/My/Desktop/project/MyMuduo/build/src && $(CMAKE_COMMAND) -P CMakeFiles/MyMuduo.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/MyMuduo.dir/clean

src/CMakeFiles/MyMuduo.dir/depend:
	cd /home/My/Desktop/project/MyMuduo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/My/Desktop/project/MyMuduo /home/My/Desktop/project/MyMuduo/src /home/My/Desktop/project/MyMuduo/build /home/My/Desktop/project/MyMuduo/build/src /home/My/Desktop/project/MyMuduo/build/src/CMakeFiles/MyMuduo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/MyMuduo.dir/depend
