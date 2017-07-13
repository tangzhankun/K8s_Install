#!/bin/bash
while read line
do
    echo "$line>:"
    ssh "$line" "$2" < /dev/null
done < "$1"
