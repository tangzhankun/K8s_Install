#!/bin/bash
cd $SPARK_HOME
echo "172.16.3.68 r03s09" >> /etc/hosts
if ! [ -z ${HDFS_HOSTENTRY} ]; then echo ${HDFS_HOSTENTRY} >> /etc/hosts; fi
cat /etc/hosts
./start_jstack.sh "KubernetesSparkDependencyDownloadInitContainer"
export SPARK_CLASSPATH="${SPARK_HOME}/jars/*"
bin/spark-class org.apache.spark.deploy.rest.kubernetes.KubernetesSparkDependencyDownloadInitContainer $@
