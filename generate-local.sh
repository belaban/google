#!/bin/bash

base_port=7600
port=0
coord="T"

for i in {1..200}
do
    if [ $i -eq 1 ]
    then
       coord="T"
    else
       coord="F"
    fi
    port=$(($base_port + $i))
    echo "$i    $i   192.168.1.5:${port} $coord"
done
