#!/bin/bash
rm dist/dockerfiles -rf
cp -r ../zhankun/custom-dockerfiles dist/dockerfiles
cd dist

docker build -t spark-base:debug -f dockerfiles/spark-base/Dockerfile .
docker build -t spark-driver:debug -f dockerfiles/driver/Dockerfile .
#docker build -t spark-driver-py:debug -f dockerfiles/driver-py/Dockerfile .
docker build -t spark-executor:debug -f dockerfiles/executor/Dockerfile .
#docker build -t spark-executor-py:debug -f dockerfiles/executor-py/Dockerfile .
docker build -t spark-init:debug -f dockerfiles/init-container/Dockerfile .
docker build -t spark-staging-server:debug -f dockerfiles/resource-staging-server/Dockerfile .
docker build -t spark-shuffle-service:debug -f dockerfiles/shuffle-service/Dockerfile .

docker tag spark-base:debug 172.16.3.78:4000/spark-base:debug
docker tag spark-driver:debug 172.16.3.78:4000/spark-driver:debug
#docker tag spark-driver-py:debug 172.16.3.78:4000/spark-driver-py:debug
docker tag spark-executor:debug 172.16.3.78:4000/spark-executor:debug
#docker tag spark-executor-py:debug 172.16.3.78:4000/spark-executor-py:debug
docker tag spark-init:debug 172.16.3.78:4000/spark-init:debug
docker tag spark-staging-server:debug 172.16.3.78:4000/spark-staging-server:debug
docker tag spark-shuffle-service:debug 172.16.3.78:4000/spark-shuffle-service:debug

docker push 172.16.3.78:4000/spark-base:debug
docker push 172.16.3.78:4000/spark-driver:debug
#docker push 172.16.3.78:4000/spark-driver-py:debug
docker push 172.16.3.78:4000/spark-executor:debug
#docker push 172.16.3.78:4000/spark-executor-py:debug
docker push 172.16.3.78:4000/spark-init:debug
docker push 172.16.3.78:4000/spark-staging-server:debug
docker push 172.16.3.78:4000/spark-shuffle-service:debug

