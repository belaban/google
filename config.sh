

## max number of instances created
max_cluster_size=500


machine_type=n1-standard-1
zone=us-central1-b

OPTS="--image=jgroups2 --disk=jgroups-disk,mode=ro --machine_type=${machine_type} --auto_delete_boot_disk --zone=${zone}"

