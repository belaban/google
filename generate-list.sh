#!/bin/bash

filename=00000000-0000-0000-0000-000000000001.box1.list

#gcutil listinstances |grep RUNNING|awk '{if(NR==1) print $2, NR, $8":7800 T"; else print $2,NR,$8":7800 F"}' > $filename
cat dump.txt |grep RUNNING | awk '{print $2, NR, $8":7800 " (NR==1?" T" : " F")}' > $filename
cat $filename
echo ""
echo "The generated file is $filename"
