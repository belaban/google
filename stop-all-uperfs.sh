
#!/bin/bash


source config.sh

## Stop the first UPerf manually !

for (( i=2; i<=max_cluster_size; i++ )) ; {
    echo "Stopping box${i}"
    gcutil ssh box${i} "killall java" &
}

