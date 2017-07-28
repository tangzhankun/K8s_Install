#!/bin/bash 
/root/spark-on-k8s/dist/bin/spark-submit \
  --deploy-mode cluster \
  --class org.apache.spark.examples.GroupByTest \
  --master k8s://http://172.16.3.68:8080 \
  --kubernetes-namespace ns-calico1 \
  --conf spark.executor.instances=5 \
  --conf spark.app.name=GroupByTest \
  --conf spark.executor.instances=3 \
  --conf spark.executor.cores=4 \
  --conf spark.executor.memory=16g \
  --conf spark.executorEnv.user=calico1 \
  --conf spark.executorEnv.USER_NAME=calico1 \
  --conf spark.kubernetes.driverEnv.user=calico1 \
  --conf spark.kubernetes.driverEnv.USER_NAME=calico1 \
  --conf spark.kubernetes.driver.docker.image=172.16.3.78:4000/spark-driver:jdv1 \
  --conf spark.kubernetes.executor.docker.image=172.16.3.78:4000/spark-executor:jdv1 \
  --conf spark.kubernetes.initcontainer.docker.image=172.16.3.78:4000/spark-init:jdv1 \
  --conf spark.kubernetes.driver.labels="user=calico1" \
  --conf spark.kubernetes.executor.labels="user=calico1" \
  local:///opt/spark/examples/jars/spark-examples_2.11-2.1.0-k8s-0.2.0-SNAPSHOT.jar 10 640000 4000
