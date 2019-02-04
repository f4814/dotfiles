#!/bin/sh

swayidle \
    timeout 180 '~/.config/sway/lock.sh LOCK' \
    timeout 180 'swaymsg "output * dpms off"' \
        resume 'swaymsg "output * dpms on"' \
    before-sleep '~/.config/sway/lock.sh LOCK'
