#!/usr/bin/bash

#cd /usr/local/bin
#ls 
source ./env.sh

subcmd=""


for port in `seq 8001 8006`; do \
    subcmd="${subcmd} ${serverIp}:${port}"
done

echo "redis-cli --pass ${requirepass} --cluster create ${subcmd} --cluster-replicas 1"
# redis-cli -a ${requirepass} --cluster create ${subcmd} --cluster-replicas 1
