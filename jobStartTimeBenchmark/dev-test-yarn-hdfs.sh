#!/bin/bash 
/root/spark-2.1.0-bin-hadoop2.7/bin/spark-submit \
  --deploy-mode cluster \
  --class org.apache.spark.examples.GroupByTest \
  --master yarn \
  --conf spark.executor.instances=5 \
  --conf spark.app.name=GroupByTest \
  --conf spark.executor.cores=4 \
  --conf spark.executor.memory=16g \
  hdfs:///user/root/spark-examples_2.11-2.1.0-k8s-0.2.0-SNAPSHOT.jar 10 20000 4000
