
#!/bin/bash

source config.sh

if [ $# -ne 3 ];
    then echo "start-ispn-perf-test.sh <instance ID> <bind-port> <number of nodes>"
    exit -1
fi

instance_id=$1
machine=${prefix}${instance_id}
bind_port=$2
num_nodes=$3
props=infinispan-google.xml
ssh_args="--log_level=WARNING --ssh_arg=-x --ssh_arg=-oLogLevel=quiet"
command="gcutil ssh ${ssh_args} ${machine} "

for (( i=1; i<= ${num_nodes}; i++ )) ; {
    node_name=${machine}.${i}
    uuid=$((${instance_id} * ${num_nodes} - ${num_nodes} + ${i}))
    tmp_port=$((${bind_port} + ${i} -1))
    # echo "machine=${machine}: node: ${node_name} uuid: ${uuid} port=${tmp_port}"
    cmd="nohup ispn-perf-test.sh -cfg ${props} -name ${node_name} -uuid ${uuid} -port ${tmp_port} -nohup > /dev/null 2> /dev/null < /dev/null &"
    command="${command} ${cmd}"
}


${command}
