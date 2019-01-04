#!/usr/bin/env bash
if pgrep waybar
then
    pkill waybar
else
    waybar
fi
