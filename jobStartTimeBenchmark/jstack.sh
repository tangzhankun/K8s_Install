#!/bin/bash
processName=$1
while [ True ]
do
  pid=`jps |grep -w $processName | awk '{print $1}'`
  if [ ! -z "$pid" ]; then
    jstack -l $pid >> /tmp/jstack/jstack.log
  fi
  sleep 1
done
