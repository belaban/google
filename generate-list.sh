#!/bin/bash

#filename=00000000-0000-0000-0000-000000000001.m1.list

# gcutil listinstances |grep RUNNING | awk '{print $2, substr($2,match($2,/[0-9]+/),RLENGTH), $8":7800 " (NR==1?" T" : " F")}'
cat dump.txt |grep RUNNING | awk '{print $2, substr($2,match($2,/[0-9]+/),RLENGTH), $8":7800 " (NR==1?" T" : " F")}'
