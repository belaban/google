
#!/bin/bash

source config.sh

name=$1
uuid=$2
props=http://storage.googleapis.com/jgroups-bucket/google.xml

gcutil ssh ${name} "nohup uperf.sh -props $props -name ${name} -uuid ${uuid} -nohup > /dev/null 2> /dev/null < /dev/null &"
