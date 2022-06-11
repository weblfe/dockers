#!/usr/bin/bash

source ./env.sh

for port in `seq 8001 8006`; do \
  mkdir -p ./redis-cluster/${port}/conf \
  && IP=${serverIp} PORT=${port} MASTERPASS=${masterauth} NODEPASS=${requirepass}  \
  envsubst < ./redis.conf > ./redis-cluster/${port}/conf/redis.conf \
  && mkdir -p ./redis-cluster/${port}/data; \
done

#docker-compose up -d