#!/bin/bash

current=$(pacmd list-sinks | grep 'active port:' | grep 'analog' | tr -s ' ' | cut -d: -f2)

if [ $current == "<analog-output-lineout>" ]; then

    out=$(pacmd set-sink-port 1 analog-output-headphones)

    if [ "$out" != "" ]; then
        pacmd set-sink-port 0 analog-output-headphones
    fi

elif [ $current == "<analog-output-headphones>" ]; then

    out=$(pacmd set-sink-port 1 analog-output-lineout)

    if [ "$out" != "" ]; then
        pacmd set-sink-port 0 analog-output-lineout
    fi

fi
