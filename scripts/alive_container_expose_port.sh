#!/bin/bash

# docker inspect gaming_container | grep \"IPAddr | head -1 | awk '{print $2}' | cut -d'"' -f2
# Check if that's up-to date
docker_ip="172.17.0.2"

# You probably want to change that
docker_port="36511"

outside_port="12345"

#echo "run:     rm /tmp/backpipe     after closing this script"

#mkfifo /tmp/backpipe
#nc -kl $outside_port 0</tmp/backpipe | nc $docker_ip $docker_port 1>/tmp/backpipe
#rm /tmp/backpipe

ncat -l -k -p $outside_port -c "nc $docker_ip $docker_port" 2>/dev/null

