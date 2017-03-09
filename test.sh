#!/bin/bash

echo start pcmk_test1 pcmk_testr2 pcmk_test3
docker run -d -P  --privileged=true --name=pcmk_test1 pacemaker_docker
docker run -d -P  --privileged=true --name=pcmk_test2 pacemaker_docker
docker run -d -P  --privileged=true --name=pcmk_test3 pacemaker_docker


echo Start pcs auth
docker exec -it pcmk_test1 pcs cluster auth 172.17.0.3 172.17.0.4 172.17.0.5 -u hacluster -p hacluster

echo Restart Cluster
docker ecec -it pcmk_test1 /usr/sbin/pcmk_restart.sh
docker ecec -it pcmk_test2 /usr/sbin/pcmk_restart.sh
docker ecec -it pcmk_test3 /usr/sbin/pcmk_restart.sh
