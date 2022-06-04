#!/bin/bash

# Requires xdotool and xprop

window=$(xdotool search --name $1)
xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $window
