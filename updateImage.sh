#!/bin/bash
rm dist/dockerfiles -rf
cp -r ../zhankun/custom-dockerfiles dist/dockerfiles
cd dist
docker build -t spark-base:wip -f dockerfiles/spark-base/Dockerfile .
docker build -t spark-driver:wip -f dockerfiles/driver/Dockerfile .
docker build -t spark-driver-py:wip -f dockerfiles/driver-py/Dockerfile .
docker build -t spark-executor:wip -f dockerfiles/executor/Dockerfile .
docker tag spark-base:wip 172.16.3.78:4000/spark-base:wip
docker tag spark-driver:wip 172.16.3.78:4000/spark-driver:wip
docker tag spark-driver-py:wip 172.16.3.78:4000/spark-driver-py:wip
docker tag spark-executor:wip 172.16.3.78:4000/spark-executor:wip
docker push 172.16.3.78:4000/spark-base:wip
docker push 172.16.3.78:4000/spark-driver:wip
docker push 172.16.3.78:4000/spark-driver-py:wip
docker push 172.16.3.78:4000/spark-executor:wip
