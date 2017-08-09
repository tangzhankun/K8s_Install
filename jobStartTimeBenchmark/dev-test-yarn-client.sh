#!/bin/bash 
/root/spark-2.1.0-bin-hadoop2.7/bin/spark-submit \
  --deploy-mode client \
  --class org.apache.spark.examples.GroupByTest \
  --master yarn \
  --conf spark.executor.instances=5 \
  --conf spark.app.name=GroupByTest \
  --conf spark.executor.cores=4 \
  --conf spark.executor.memory=16g \
  /root/spark-2.1.0-bin-hadoop2.7/examples/jars/spark-examples_2.11-2.1.0.jar 10 20000 4000
