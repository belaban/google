
#!/bin/bash

source config.sh


for (( i=1; i<=max_cluster_size; i++ )) ; {
    echo "stopping box${i}"
    ./stop-instance.sh box${i} &
}

