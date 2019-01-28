#!/bin/sh


pgrep openvpn > /dev/null
if [ $? -ne 0 ]; then
    state="down"
    name="VPN Down"
else
    state="up"
    name=$(pgrep -a openvpn$ | head -n 1 | awk '{print $NF }' | sed -e 's/.conf//')
fi

jq -c -n --arg class "$state" \
    --arg text "$name" \
    '{"text": $text, "class": $class}'
