#!/bin/bash 
/root/spark-on-k8s/dist/bin/spark-submit \
  --deploy-mode cluster \
  --class org.apache.spark.examples.GroupByTest \
  --master k8s://http://172.16.3.68:8080 \
  --kubernetes-namespace ns-calico1 \
  --conf spark.executor.instances=5 \
  --conf spark.app.name="GroupByTest" \
  --conf spark.executor.cores=4 \
  --conf spark.executor.memory=16g \
  --conf spark.executorEnv.user=calico1 \
  --conf spark.executorEnv.user=calico1 \
  --conf spark.executorEnv.USER_NAME="calico1" \
  --conf spark.kubernetes.driverEnv.user=calico1 \
  --conf spark.kubernetes.driverEnv.user=calico1 \
  --conf spark.kubernetes.driverEnv.USER_NAME=calico1 \
  --conf spark.kubernetes.driver.docker.image=172.16.3.78:4000/spark-driver:debug \
  --conf spark.kubernetes.executor.docker.image=172.16.3.78:4000/spark-executor:debug \
  --conf spark.kubernetes.initcontainer.docker.image=172.16.3.78:4000/spark-init:debug \
  --conf spark.kubernetes.driver.labels="user=calico1,purpose=hdfs" \
  --conf spark.kubernetes.executor.labels="user=calico1" \
  --conf spark.kubernetes.executor.finalDeletion=false \
  --conf spark.kubernetes.docker.image.pullPolicy="Always" \
  hdfs://172.16.3.68:9000/user/root/spark-examples_2.11-2.1.0-k8s-0.2.0-SNAPSHOT.jar 10 20000 4000
#  hdfs:///user/root/spark-examples_2.11-2.1.0-k8s-0.2.0-SNAPSHOT.jar 10 20000 4000
#  local:///opt/spark/examples/jars/spark-examples_2.11-2.1.0-k8s-0.3.0-SNAPSHOT.jar 10 20000 4000
#  --conf spark.kubernetes.docker.image.pullPolicy="Always" \
#  --conf spark.kubernetes.allocation.batch.size=20\
#  --conf spark.kubernetes.executor.finalDeletion=false \
