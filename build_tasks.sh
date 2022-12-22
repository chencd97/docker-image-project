#!/bin/bash
#
# 修改 apt sources 源
mv /etc/apt/sources.list /etc/apt/sources.list.bak
cp -rf /home/docker/sources.list /etc/apt/
chmod 644 /etc/apt/sources.list
rm -rf /home/docker/sources.list
#
# apt update
apt-get update
apt-get install -y openssh-server
apt-get install -y openssh-client
apt-get install -y tzdata
apt-get install -y vim
apt-get install -y zip
apt-get install -y htop
apt-get install -y net-tools
apt-get install -y iputils-ping
apt-get install -y wget
#
# 清理缓存
apt-get autoremove -y
apt-get autoclean -y
#
# 更新时区 中国用户填写[Asia/Shanghai], 表示亚洲/上海, 东八区
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo 'Asia/Shanghai' > /etc/timezone
#
# 恢复源文件
# rm -rf /etc/apt/sources.list
# mv /etc/apt/sources.list.bak /etc/apt/sources.list
#
# 复制ssh内容
cp -rf /home/docker/sshd_config /etc/ssh/
cp -rf /home/docker/ssh_config /etc/ssh/
chmod 644 /etc/ssh/sshd_config && chmod 644 /etc/ssh/ssh_config
rm -rf /home/docker/sshd_config && rm -rf /home/docker/ssh_config