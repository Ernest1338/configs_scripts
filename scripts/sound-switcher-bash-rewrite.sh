#!/bin/bash

current=$(pactl list sinks | grep 'Active Port:' | grep 'analog' | cut -d' ' -f3)

if [[ $current == "analog-output-lineout" ]]; then

    pactl set-sink-port 0 analog-output-headphones

elif [[ $current == "analog-output-headphones" ]]; then

    pactl set-sink-port 0 analog-output-lineout

fi
