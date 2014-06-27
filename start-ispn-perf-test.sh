
#!/bin/bash

source config.sh

name=$1
uuid=$2
props=infinispan-google.xml

gcutil ssh ${name} "nohup ispn-perf-test.sh -cfg $props -name ${name} -uuid ${uuid} -nohup > /dev/null 2> /dev/null < /dev/null &"
#gcutil ssh ${name} "ispn-perf-test.sh -cfg $props -name ${name} -uuid ${uuid} -nohup"
