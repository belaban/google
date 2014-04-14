
#!/bin/bash


source config.sh


for (( i=1; i<=max_cluster_size; i++ )) ; {
    echo "starting box${i}"
    ./start-instance.sh box${i} &
}

