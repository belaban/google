#!/bin/bash

source config.sh

#filename=00000000-0000-0000-0000-000000000001.m1.list

if [ $# -ne 1 ];
    then echo "generate-list.sh <number of nodes per machine>"
    exit -1
fi

num_nodes=$1

# gcutil listinstances |grep RUNNING | awk -f generate.awk
gcutil listinstances |grep RUNNING | awk -f generate.awk -v num_nodes=${num_nodes}
