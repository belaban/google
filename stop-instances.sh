
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
    echo "stopping box${i}"
    ./stop-instance.sh box${i} &
    sleep 1

    if [ $((i % 100)) == 0 ]
        then
           sleep 5
    fi
}

