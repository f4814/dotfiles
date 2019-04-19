#!/usr/bin/env bash

pic="~/.config/sway/lock.png"

lock() {
# grim -t png $1
# convert -blur 0x6 $1 $1
swaylock -i $1
}

pkill swaynag # Prevent from double clicking
swaymsg mode "default"

if [ "$1" == "SUSPEND" ]; then
    systemctl suspend
elif [ "$1" ==  "HIBERNATE" ]; then
    systemctl hibernate
elif [ "$1" == "LOGOUT" ]; then
    swaymsg -r exit
elif [ "$1" == "REBOOT" ]; then
    reboot
elif [ "$1" == "POWEROFF" ]; then
    poweroff
elif [ "$1" == "LOCK" ]; then
    lock $pic
else
    if pgrep swayidle > /dev/null; then
        killall -SIGUSR1 swayidle
    else
        lock $pic
    fi
fi

