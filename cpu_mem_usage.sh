#!/bin/bash

#set -x
file=cpu_mem_usage.txt
cpu=`top -bn1 | grep "Cpu(s)" | awk -F' ' '{print $2}'`
mem=`free -g | grep 'Mem:' | awk -F' ' '{print $2}'`
diskused=`df -Ph | grep -e "/vagrant" | awk -F' ' '{print $3}'`
diskav=`df -Ph | grep -e "/vagrant" | awk -F' ' '{print $4}'`
cat << EOF > $file
----------------------------------------
|          |          |   Disk Usage   |
|   CPU    |   MEM    |----------------|
|          |          |  used  | free  |
|----------|----------|--------|-------|
|   $cpu    |    $mem     |  $diskused  | $diskav  |
----------------------------------------
EOF