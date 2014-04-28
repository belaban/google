
#!/bin/bash


source config.sh

## The first instance is started synchronously, so we avoid merging
#./start-uperf.sh box1

## Start the first instance manually !

if [ $# -ne 2 ]; 
    then echo "start-uperfs <from> <to>"
    exit -1
fi

from=$1
to=$2

echo "Starting UPerfs $from - $to"


for (( i=$from; i<=$to; i++ )) ; {
    echo "starting UPerf on box${i}"
    ./start-uperf.sh box${i} &

    sleep 1


    if [ $((i % 100)) == 0 ]
        then
           sleep 5
    fi


}

