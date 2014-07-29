
#!/bin/bash

source config.sh

gcutil addinstance ${OPTS} --metadata_from_file=startup-script:start-script.sh $*
