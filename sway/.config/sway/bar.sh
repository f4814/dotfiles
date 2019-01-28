#!/usr/bin/env bash
if pgrep waybar
then
    pkill waybar
    pkill music-player.sh
else
    waybar
fi
