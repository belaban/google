

## max number of instances created
max_cluster_size=10


machine_type=n1-highcpu-4
zone=us-central1-b

OPTS="--image=jgroups2 --disk=jgroups-disk,mode=ro --machine_type=${machine_type} --auto_delete_boot_disk --zone=${zone}"

