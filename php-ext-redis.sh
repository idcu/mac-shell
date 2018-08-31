#!/bin/bash
#创建编译目录
mkdir -p ~/build && \
#进入build目录
cd ~/build && \
#删除已存在的redis-src目录
rm -rf ./redis-src && \
#下载master分支redis源码到/tmp目录
curl -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/3.1.4.tar.gz -L && \
#解压redis源码到当前目录
tar zxvf /tmp/redis.tar.gz && \
#重命名文件夹为redis-src
mv redis-src* redis-src && \
#进入redis-src目录
cd redis-src && \
#侦测php环境
phpize && \
#检测平台特征，生成Makefile
./configure \
--with-php-config=/usr/bin/php-config && \
#清除上次make命令编译产生的object文件（*.o）及可执行文件
make clean && \
#从Makefile读取指令，然后编译
make && \
#从Makefile读取指令，安装到指定的位置
sudo make install