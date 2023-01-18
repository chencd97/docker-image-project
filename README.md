## Docker Hub
https://hub.docker.com/r/chencd97/demo

## 镜像修改内容

镜像来自 Docker Hub [chencd97/base](https://hub.docker.com/r/chencd97/base) (与 `teg` 标签对应)

1.`ubuntu` 的 `apt` 源已更换为 `ubuntu` 中国服务器(官方) http://cn.archive.ubuntu.com/ubuntu/

2.时区已修改为 `Asia/Shanghai` 亚洲/上海, 东八区 (可能无效)

3.预装以下组件

- openssh-server
- openssh-client
- tzdata
- vim
- zip
- htop
- net-tools
- iputils-ping
- wget

4.无 `端口暴露`

5.无 `持久化目录`

## 注意

因为构建镜像的Dockerfile文件最后一行为 `ENTRYPOINT ["sh", "/home/docker/_init.sh"]`

容器入口就是 `/home/docker/_init.sh`, 所以创建并启动容器时 (后续每次启动容器) 会执行

但我并没有创建此文件, 因此你可以自行创建 `_init.sh` 文件并挂载到容器内执行你的项目

如: 将你的 `_init.sh` 挂载到 `/home/docker/` 下

```shell
sudo docker run -d \
                -p 2222:22 \
                --name java-dev \
                -v /you/path/_init.sh :/home/docker/_init.sh \
                chencd97/demo:ojre17_latest

sudo docker run -d \
                -p 2222:22 \
                --name java-dev \
                -v /you/path/:/home/docker \
                chencd97/demo:ojre17_latest
```

因镜像有安装 `openssh-server` 如需使用 `ssh` 连接容器, 请注意设置容器内的 `root` 用户密码 与 容器 `22` 端口与主机的映射