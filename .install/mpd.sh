#!/bin/sh

list_supported() {
    echo "arch"
}

install_arch() {
    sudo pacman -S mpd mpc ncmpcpp
}

install_gentoo() {
    sudo emerge --ask media-sound/mpd media-sound/mpc media-sound/ncmpcpp
}

eval $1
