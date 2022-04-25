#!/usr/bin/env fish

function active-port
    pacmd list-sinks |\
    grep 'active port:' |\
    tr -s ' ' |\
    cut -d: -f2 |\
    string trim
end

set -l _active_port (active-port)
echo "Active:$_active_port"
switch $_active_port
    case '<analog-output-lineout>'
        pacmd set-sink-port 0 analog-output-headphones
	amixer -c 0 set 'Auto-Mute Mode' Enabled
    case '<analog-output-headphones>'
        pacmd set-sink-port 0 analog-output-lineout
	amixer -c 0 set 'Auto-Mute Mode' Disabled
    case '*'
        exit 1
end
echo 
echo "Changed:"(active-port)
