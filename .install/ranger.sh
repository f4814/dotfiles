#!/bin/sh

list_supported() {
    echo "arch debian raspbian"
}

install_debian() {
    sudo apt install ranger
}

install_raspbian() {
    install_debian
}

install_arch() {
    sudo pacman -S ranger atool
}

eval $1
