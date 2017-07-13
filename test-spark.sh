#!/bin/bash 
/root/spark-on-k8s/dist/bin/spark-submit \
  --deploy-mode cluster \
  --class org.apache.spark.examples.GroupByTest \
  --master k8s://http://localhost:8080 \
  --kubernetes-namespace default \
  --conf spark.executor.instances=5 \
  --conf spark.app.name=GroupByTest \
  --conf spark.executor.instances=3 \
  --conf spark.executor.cores=4 \
  --conf spark.executor.memory=8g \
  --conf spark.kubernetes.driver.docker.image=spark-driver:jd \
  --conf spark.kubernetes.executor.docker.image=spark-executor:jd \
  --conf spark.kubernetes.initcontainer.docker.image=spark-init:jd \
  local:///opt/spark/examples/jars/spark-examples_2.11-2.1.0-k8s-0.2.0-SNAPSHOT.jar 10 400000 2
