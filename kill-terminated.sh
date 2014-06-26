#!/bin/bash

gcutil listinstances | grep TERMINATED | awk '{print "stopping $2"; system("./stop-instance.sh $2")}'
