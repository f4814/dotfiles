#!/usr/bin/env bash

pic="/tmp/pic.png"

# handle being called from systemd service
# if [ -z "$XDG_RUNTIME_DIR" ] && [ -z "$SWAYSOCK"]; then
# 	uid=$(id -u $USER)
# 	export XDG_RUNTIME_DIR="/run/user/"$uid"/"
# 	export SWAYSOCK=$(find $XDG_RUNTIME_DIR -iname sway*sock)
# fi

swaygrab $pic
convert -blur 0x6 $pic $pic

swaylock -i $pic
swaymsg mode "default"

