#!/bin/sh

list_supported() {
    echo "arch"
}

install_arch() {
    sudo pacman -S git vim
}
