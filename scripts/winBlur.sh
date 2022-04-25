#!/bin/bash
userArg1="$1"
winPid1=$(ps aux | grep "$userArg1" | grep -v grep | grep -v bash | awk '{print $2}') 
winWin1=$(xdotool search --pid $winPid1)
xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $winWin1
