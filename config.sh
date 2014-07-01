


machine_type=n1-highcpu-4
#machine_type=n1-standard-1
#zone=us-central1-b
zone=europe-west1-b

OPTS="--image=jgroups2 --disk=jgroups-disk,mode=ro --machine_type=${machine_type} --auto_delete_boot_disk --zone=${zone}"
OPTS="${OPTS} --max_wait_time=30 --sleep_between_polls=10 --synchronous_mode=false"

