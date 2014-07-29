
#!/bin/bash

source config.sh

if [ $# -ne 4 ];
    then echo "start-ispn-perf-test.sh <instance ID> <bind-port> <number of nodes> <debug>"
    exit -1
fi

instance_id=$1
machine=${prefix}${instance_id}
bind_port=$2
num_nodes=$3
debug=$4
props=infinispan-google.xml
ssh_args="--log_level=WARNING --ssh_arg=-x --ssh_arg=-oLogLevel=quiet"
command="gcutil ssh ${ssh_args} ${machine} "
executable="ispn-perf-test.sh"

if ${debug};
  then
     executable="ispn-perf-test-debug.sh"
  else
     executable="ispn-perf-test.sh"
fi


for (( i=1; i<= ${num_nodes}; i++ )) ; {
    node_name=${machine}.${i}
    uuid=$((${instance_id} * ${num_nodes} - ${num_nodes} + ${i}))
    tmp_port=$((${bind_port} + ${i} -1))
    # echo "machine=${machine}: node: ${node_name} uuid: ${uuid} port=${tmp_port}"
    out=/tmp/${node_name}.log
    cmd="nohup ${executable} -cfg ${props} -name ${node_name} -uuid ${uuid} -port ${tmp_port} -nohup > ${out} 2> ${out} < /dev/null &"
    command="${command} ${cmd}"
}


${command}
