#!/bin/sh

list_supported() {
    echo "arch"
}

install_arch() {
    sudo pacman -S vim fzf the_silver_searcher
    install_common
}

install_common() {
    # Install minpac
    git clone https://github.com/k-takata/minpac.git \
        ~/.vim/pack/minpac/opt/minpac

    # Make backup dir
    mkdir ~/.vim/backup

    echo "You still have to install the plugins using :PackUpdate in vim!"
}