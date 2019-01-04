#!/bin/sh

if [ $(brillo -k) == "100.00" ]; then
    brillo -k -S 0
else
    brillo -k -S 100
fi
