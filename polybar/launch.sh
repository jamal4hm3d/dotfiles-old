#!/bin/bash

killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

echo "---" | tee -a /tmp/bar0.log

if type "xrandr" > /dev/null; then	
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do		
        MONITOR=$m polybar --reload main -c ~/.config/polybar/config.ini & 2>&1 | tee -a /tmp/bar0.log & disown
    done
else
    polybar --reload main -c ~/.config/polybar/config.ini & 2>&1 | tee -a /tmp/bar0.log & disown
fi

echo "Bars launched..."