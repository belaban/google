
#!/bin/bash


source config.sh

## The first instance is started synchronously, so we avoid merging
#./start-ispn-perf-test.sh box1

## Start the first instance manually !

if [ $# -ne 2 ]; 
    then echo "start-ispn-perf-tests <from> <to>"
    exit -1
fi

from=$1
to=$2

echo "Starting IspnPerfTests $from - $to"

for (( i=$from; i<=$to; i++ )) ; {
    echo "starting IspnPerfTest on ${prefix}${i}"
    ./start-ispn-perf-test.sh ${prefix}${i} ${i} &

    if [ $((i % 100)) == 0 ]
        then
           sleep 30
    fi
}

