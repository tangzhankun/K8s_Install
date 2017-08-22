#!/bin/bash
processName=${1:-GroupByTest}
nohup ./jstack.sh $processName &
