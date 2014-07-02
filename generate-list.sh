#!/bin/bash

source config.sh

#filename=00000000-0000-0000-0000-000000000001.m1.list

if [ $# -ne 2 ];
    then echo "generate-list.sh <bind-port> <number of nodes per machine>"
    exit -1
fi

bind_port=$1
num_nodes=$2

# gcutil listinstances |grep RUNNING | awk -f generate.awk
gcutil listinstances |grep RUNNING | awk -f generate.awk -v bind_port=${bind_port} -v num_nodes=${num_nodes}
