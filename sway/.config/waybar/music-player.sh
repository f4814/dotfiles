#!/bin/sh

loop() {
    while true
    do
        pgrep waybar
        if [ $? -ne 0 ]; then
            exit
        fi

        raw=$(mpc status)

        case $raw in
            *playing*)
                status="playing"
                ;;
            *paused*)
                status="paused"
                ;;
            *)
                status="silent"
                ;;
        esac

        song=$(echo "$raw" | sed -n 1p)

        jq -c -n --arg class "$status" \
            --arg text "$song" \
        '{"text": $text, "class": $class, "percentage": $class}'

        mpc idle > /dev/null
        if [ $? -ne 0 ]; then
            sleep 10
        fi
    done
}

case $1 in
    "TOGGLE")
        mpc toggle > /dev/null
        ;;
    "UP")
        mpc volume +5 > /dev/null
        ;;
    "DOWN")
        mpc volume -5 > /dev/null
        ;;
    *)
        loop
esac
