#!/bin/bash
processName=$1
echo "trace $processName"
echo "zk:$HDFS_HOSTENTRY"
cat /etc/hosts
echo "172.16.3.68 r03s09" >> /etc/hosts
cat /etc/hosts
filename=`hostname`
while [ True ]
do
  pid=`jps |grep -w $processName | awk '{print $1}'`
  echo "pid:$pid"
  if [ ! -z "$pid" ]; then
    jstack -l $pid >> /tmp/jstack/jstack-$filename.log
  fi
  sleep 1
done
