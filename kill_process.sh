#!/bin/sh
pid=`ps -ef| grep "sleep" | grep -v grep | awk -F' ' '{print $2}'`
for i in $pid
do
    if [ $pid != -z ]
    then
        echo "The process with PID $pid will be stopped"
        kill -9 $pid
    fi
done        