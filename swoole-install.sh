#!/bin/bash
#创建build目录
mkdir -p ~/build && \
#进入build目录
cd ~/build && \
#删除已存在的swoole-src目录
rm -rf ./swoole-src && \
#下载master分支swoole源码到/tmp目录
curl -o /tmp/swoole.tar.gz https://github.com/swoole/swoole-src/archive/master.tar.gz -L && \
#解压swoole源码到当前目录
tar zxvf /tmp/swoole.tar.gz && \
#重命名文件夹为swoole-src
mv swoole-src* swoole-src && \
#进入swoole-src目录
cd swoole-src && \
#侦测php环境
phpize && \
#检测平台特征，生成Makefile
./configure \
--with-php-config=/usr/bin/php-config \
--enable-swoole-debug=yes \
--enable-sockets=yes \
--enable-openssl=yes \
--enable-http2=yes \
--enable-async-redis=yes \
--enable-mysqlnd=yes \
--enable-coroutine-postgresql=yes && \
#清除上次make命令编译产生的object文件（*.o）及可执行文件
make clean && \
#从Makefile读取指令，然后编译
make && \
#从Makefile读取指令，安装到指定的位置
sudo make install
