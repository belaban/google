#!/bin/bash

gcutil listinstances | grep TERMINATED | awk '{print("deleting " $2); system("gcutil deleteinstance --force --delete_boot_pd " $2 " &")}'

