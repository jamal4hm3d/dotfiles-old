#!/bin/bash

blueman-applet &
nm-applet &
kdeconnect-indicator &
mako &
/usr/lib/polkit-1/polkitd
/home/jamal/.config/polybar/scripts/pywal.sh ~/Pictures/Wallpapers
$HOME/.config/mako/update-theme.sh
/home/jamal/.config/polybar/launch.sh
