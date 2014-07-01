
#!/bin/bash

source config.sh


if [ $# -ne 2 ]; 
    then echo "stop-instances <from> <to>"
    exit -1
fi

from=$1
to=$2

echo "Stopping instances $from - $to"



for (( i=$from; i<=$to; i++ )) ; {
    echo "stopping ${prefix}${i}"
    ./stop-instance.sh ${prefix}${i} &
#    sleep 1

    if [ $((i % 100)) == 0 ]
        then
           sleep 30
    fi
}

