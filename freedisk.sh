#!/bin/bash
THRESHOLD=90

usedisk=`df -hP | awk -F' ' '{print $5,$6}' | tr -d '%' | sed '1d'`

while read data
do
    max=`echo $data | awk -F' ' '{print $1}'`
    part=`echo $data | awk -F' ' '{print $2}'`
    if [ $max -gt $THRESHOLD ]
    then
        echo "The partition $part is $max % used which is greater than the $THRESHOLD"
    fi    
done <<< $usedisk