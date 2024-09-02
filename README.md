## Docker Hub

https://hub.docker.com/r/chencd97/demo

## 镜像修改内容

镜像来自 Docker Hub [chencd97/base](https://hub.docker.com/r/chencd97/base) (与 `teg` 标签对应)

1.环境变量 `TZ` 已修改为 `Asia/Shanghai` (时区)

2.环境变量 `LANG` 已修改为 `C.UTF-8` (乱码处理)

3.预装以下组件

- openssh-server

5.端口暴露 `无`

6.持久化目录 `无`

## 注意

因为构建镜像的 Dockerfile 文件最后一行为 `ENTRYPOINT ["sh", "/home/docker/_init.sh"]`

容器入口就是 `/home/docker/_init.sh`, 所以创建并启动容器时 (后续每次启动容器) 都会执行

你可以自行创建 `_init.sh`(可以参考仓库中的 `_init.sh` 文件模板)

并将文件并挂载到容器内执行你的项目, 如: 将你的 `_init.sh` 挂载到 `/home/docker/` 下

```shell
sudo docker run -d \
                -p 主机端口:容器中项目的端口 \
                --name test \
                -v /you/path/_init.sh :/home/docker/_init.sh:ro \
                chencd97/demo:ojre21_latest
```

### 该镜像支持使用 `ssh` 连接容器 (如不使用忽略即可)

如需使用则需要进入容器, 设置 `root` 用户密码, 并且在运行容器时将 `22` 端口与主机进行映射映射

```shell
sudo docker run -d \
                -p 2222:22 \
                -p 主机端口:容器中项目的端口 \
                --name ssh-test \
                -v /you/path/_init.sh :/home/docker/_init.sh \
                chencd97/demo:ojre21_latest
```
