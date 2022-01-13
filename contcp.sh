#!/bin/bash

# Examples:
# contcp put container_id file
# contcp put container_id file /path/
# contcp get container_id /path/
# contcp get container_id /path/ file

getput=$1
containerid=$2
arg3=$3
arg4=$4

docker start $containerid 1>/dev/null &&
if [ $getput = "get" ]; then
	if [ -z "$arg4" ]; then
		docker cp $containerid:$arg3 .
	else
		docker cp $containerid:$arg3 $arg4
	fi
else
	if [ -z "$arg4" ]; then
		docker cp $arg3 $containerid:/root/
	else
		docker cp $arg3 $containerid:$arg4
	fi
fi
