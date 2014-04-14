
#!/bin/bash

source config.sh

name=$1

gcutil ssh ${name} "nohup uperf.sh -props ./google.xml -name ${name} -nohup > /dev/null 2> /dev/null < /dev/null &"
