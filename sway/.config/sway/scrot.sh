#!/bin/sh

name=~/pictures/screenshots/$(date +'%Y-%m-%d-%H:%M:%S.png')
if [ "$1" == "SCREEN" ]; then
    grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') $name
elif [ "$1" == "REGION" ]; then
    grim -g "$(slurp)" $name
else
    grim $name
fi
