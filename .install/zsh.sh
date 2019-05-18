#!/bin/sh

list_supported() {
    echo "arch"
}

install_arch() {
    sudo pacman -S fd fzf the_silver_searcher zsh zsh-syntax-highlighting
}
