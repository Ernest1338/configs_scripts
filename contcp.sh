#!/bin/bash

container=$1
file=$2
path=$3

docker start $container 1>/dev/null &&
if [ -z "$path" ]; then
	docker cp $file $container:/root/
else
	docker cp $file $container:$path
fi

