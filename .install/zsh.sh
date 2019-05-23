#!/bin/sh

list_supported() {
    echo "arch, debian, raspbian"
}

install_arch() {
    sudo pacman -S fd fzf the_silver_searcher zsh zsh-syntax-highlighting
}

install_debian() {
	sudo aptitude install zsh silversearcher-ag fd-find fzf
}

install_raspbian() {
	install_debian
}

eval $1
