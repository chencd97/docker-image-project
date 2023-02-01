#!/bin/bash
#
service ssh restart
#
chmod -R 755 /home/docker
#
# 启动容器后的操作
# rm -rf /home/docker/debug.log
# java -jar -Xms64m -Xmx128m /home/docker/demo.jar 2>&1 | tee -a /home/docker/debug.log
#
# 为了让容器不停止执行以下命令(可自行修改)
ping -i 30 127.0.0.1
