
#!/bin/bash


source config.sh

## Stop the first UPerf manually !


if [ $# -ne 2 ]; 
    then echo "stop-uperfs <from> <to>"
    exit -1
fi

from=$1
to=$2

echo "Stopping UPerfs $from - $to"


for (( i=$from; i<=$to; i++ )) ; {
    echo "Stopping UPerf on ${prefix}${i}"
    gcutil ssh ${prefix}${i} "killall java" &
#    sleep 1

    if [ $((i % 100)) == 0 ]
        then
           sleep 30
    fi
}

