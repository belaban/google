
#!/bin/bash


source config.sh

## The first instance is started synchronously, so we avoid merging
#./start-uperf.sh 1

## Start the first instance manually !

if [ $# -ne 3 ]; 
    then echo "start-uperfs <from> <to> <number of nodes per instance>"
    exit -1
fi

from=$1
to=$2
num_nodes=$3

echo "Starting UPerfs $from - $to"


for (( i=$from; i<=$to; i++ )) ; {
    echo "starting UPerf on ${prefix}${i}"
    ./start-uperf.sh ${i} ${num_nodes} &

    if [ $((i % 100)) == 0 ]
        then
           sleep 30
    fi
}

