#!/bin/bash
#
service ssh restart
#
chmod -R 755 /home/docker
#
# 启动
rm -rf /home/docker/debug.log
java -jar -Xms64m -Xmx128m /home/docker/demo.jar 2>&1 | tee -a /home/docker/debug.log
