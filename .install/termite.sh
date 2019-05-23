#!/bin/sh

list_supported() {
    echo "arch"
}

install_arch() {
        sudo pacman -S termite ttf-hack
}

eval $1
