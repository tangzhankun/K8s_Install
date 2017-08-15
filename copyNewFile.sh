#!/bin/bash
scp zhankun@omega.sh.intel.com:/home/zhankun/Downloads/spark-2.1.0-k8s-0.2.0-SNAPSHOT-bin-debugJobLatency.tgz ./
rm dist -rf
tar zxf spark-2.1.0-k8s-0.2.0-SNAPSHOT-bin-debugJobLatency.tgz
mv spark-2.1.0-k8s-0.2.0-SNAPSHOT-bin-debugJobLatency dist
cp -r dockerfiles dist/
