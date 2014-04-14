
#!/bin/bash


source config.sh


for (( i=1; i<=max_cluster_size; i++ )) ; {
    echo "starting box${i}"
    ./start-instance.sh box${i} &

#    if [ $((i % 50)) == 0 ]
#        then
#           sleep 1
#    fi

    if [ $((i % 100)) == 0 ]
        then
           sleep 10
    fi
}

