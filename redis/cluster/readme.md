## redis cluster 搭建

Start
> 1. 初始配置目录

## 注意: setup.sh 脚本中 ip地址 和 密码 按各种需求修改

变量说明: 

serverIp: 部署docker宿主机器内网ip
masterauth: redis主节点密码
requirepass: redis从节点密码
port:  redis服务端口

```sh
# 运行出配置脚本
$ setup.sh
```
> 2. docker-compose 构建

```sh
$ docker-compose up -d 
```

> 3. docker 实例启动成功后,进入任意一台redis

```sh
# 执行生成 集群启动 配置命令
$ cluster.sh 
# redis-cli --pass XXXX --cluster create  192.168.3.97:8001 192.168.3.97:8002 192.168.3.97:8003 192.168.3.97:8004 192.168.3.97:8005 192.168.3.97:8006 --cluster-replicas 1
# 复制 命令在进入docker 后使用 
# 进入docker
$ docker exec -it redis8001 /bin/sh
$ cd /usr/local/bin
# 查看目录下可执行的文件
$ ls
# 有如下 redis-cli即可
#docker-entrypoint.sh  gosu  redis-benchmark  redis-check-aof  redis-check-rdb  redis-cli  redis-sentinel  redis-server
# 将命令黏贴到命令 回车执行
$ redis-cli --pass XXXX --cluster create  192.168.3.97:8001 192.168.3.97:8002 192.168.3.97:8003 192.168.3.97:8004 192.168.3.97:8005 192.168.3.97:8006 --cluster-replicas 1
```

> 4. 上诉步骤完成, 剩下就是测试redis (注意cluster默认redis集群不支持切库)
