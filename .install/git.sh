#!/bin/sh

list_supported() {
    echo "arch debian rasbian"
}

install_arch() {
    sudo pacman -S git vim
}

install_debian() {
    sudo apt install git
}

install_raspbian() {
    install_debian
}

install_gentoo() {
    sudo emerge --ask dev-vcs/git
}

eval $1
