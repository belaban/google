
#!/bin/bash


source config.sh

## The first instance is started synchronously, so we avoid merging

## Start the first instance manually !

if [ $# -ne 5 ];
    then echo "start-ispn-perf-tests <from> <to> <start-port> <number of nodes per instance> <debug>"
    exit -1
fi

from=$1
to=$2
bind_port=$3
num_nodes=$4
debug=$5

echo "Starting IspnPerfTest $from - $to"


for (( i=$from; i<=$to; i++ )) ; {
    echo "starting IspnPerfTest on ${prefix}${i}"
    ./start-ispn-perf-test.sh ${i} ${bind_port} ${num_nodes} ${debug} &

    if [ $((i % 100)) == 0 ]
        then
           sleep 30
    fi
}

