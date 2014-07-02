##!/bin/awk -f

## Change the base port below if instances need to start at a different port

## Original expr: {print $2, substr($2,match($2,/[0-9]+/),RLENGTH), $8":7800 " (NR==1?" T" : " F")}


BEGIN {
    uuid=0;
    if(length(num_nodes) == 0)
        num_nodes=1;
    if(length(bind_port) == 0)
        bind_port=7800;
    is_coord=1;
}

{
    ip_addr=$8;
    uuid=substr($2,match($2,/[0-9]+/),RLENGTH);

    for(i=1; i <= num_nodes; i++) {
        logical_name=$2 "." i
        tmp_uuid=uuid * num_nodes - num_nodes +i;
        print(logical_name, tmp_uuid, ip_addr ":" (bind_port+i-1), is_coord == 1? "T" : "F");
        if(is_coord == 1)
            is_coord=0;
    }
}