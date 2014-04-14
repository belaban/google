
#!/bin/bash

source config.sh

DEL_OPTS="--force --delete_boot_pd"


gcutil deleteinstance ${DEL_OPTS} $*
