
#!/bin/bash


source config.sh

if [ $# -ne 2 ]; 
    then echo "start-instances <from> <to>"
    exit -1
fi

from=$1
to=$2

echo "Starting instances $from - $to"


for (( i=$from; i<=$to; i++ )) ; {
    echo "starting ${prefix}${i}"
    ./start-instance.sh ${prefix}${i} &

    if [ $((i % 100)) == 0 ]
        then
           sleep 30
    fi
}

