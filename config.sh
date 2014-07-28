#!/bin/bash

# The prefix for all instances, Will be suffixed with an int, e.g. box1, box2 etc
prefix="m"

machine_type=n1-highcpu-4
#machine_type=n1-highcpu-8
#machine_type=n1-standard-2
zone=us-central1-b
#zone=europe-west1-b
base_port=7800

OPTS="--image=jgroups3 --disk=jgroups-disk,mode=ro --machine_type=${machine_type} --auto_delete_boot_disk --zone=${zone}"
OPTS="${OPTS} --max_wait_time=30 --sleep_between_polls=10 --synchronous_mode=false"

