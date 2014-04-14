
#!/bin/bash


source config.sh

## The first instance is started synchronously, so we avoid merging
#./start-uperf.sh box1

## Start the first instance manually !

for (( i=2; i<=max_cluster_size; i++ )) ; {
    echo "starting box${i}"
    ./start-uperf.sh box${i} &



    if [ $((i % 10)) == 0 ]
        then
           sleep 1
    fi

    if [ $((i % 50)) == 0 ]
        then
           sleep 5
    fi


}

