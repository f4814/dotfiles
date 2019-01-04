#!/usr/bin/env bash

pic="/tmp/pic.png"

# handle being called from systemd service
# if [ -z "$XDG_RUNTIME_DIR" ] && [ -z "$SWAYSOCK"]; then
# 	uid=$(id -u $USER)
# 	export XDG_RUNTIME_DIR="/run/user/"$uid"/"
# 	export SWAYSOCK=$(find $XDG_RUNTIME_DIR -iname sway*sock)
# fi

lock() {
grim -t png $1
convert -blur 0x6 $1 $1
swaylock -i $pic --daemonize
}

swaymsg mode "default"

if [ "$1" == "SUSPEND" ]; then
    lock $pic
    systemctl suspend
elif [ "$1" ==  "HIBERNATE" ]; then
    lock $pic
    systemctl hibernate -s No
elif [ "$1" == "LOGOUT" ]; then
    swaymsg -r exit
elif [ "$1" == "REBOOT" ]; then
    reboot
elif [ "$1" == "POWEROFF" ]; then
    poweroff
else
    lock $pic
fi

pkill swaynag
