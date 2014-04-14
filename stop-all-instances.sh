
#!/bin/bash

source config.sh


for (( i=1; i<=max_cluster_size; i++ )) ; {
    echo "stopping box${i}"
    ./stop-instance.sh box${i} &

    if [ $((i % 50)) == 0 ]
        then
           sleep 5
    fi
}

