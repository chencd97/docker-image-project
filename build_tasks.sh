#!/bin/bash
#
# 修改 apt sources 源
# mv /etc/apt/sources.list /etc/apt/sources.list.bak
# cp -rf /home/docker/sources.list /etc/apt/
# chmod 644 /etc/apt/sources.list
# rm -rf /home/docker/sources.list
#
# 恢复源文件
# rm -rf /etc/apt/sources.list
# mv /etc/apt/sources.list.bak /etc/apt/sources.list
#
# apt update
apt-get update
apt-get install -y openssh-server
#
# 清理缓存
apt-get autoremove -y
apt-get autoclean -y
