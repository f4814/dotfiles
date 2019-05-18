#!/bin/sh

list_supported() {
    echo "arch"
}

install_arch() {
    sudo pacman -S mpd mpc ncmpcpp
}
