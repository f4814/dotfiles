install_gentoo() {
    sudo emerge --ask www-client/qutebrowser
}

install_arch() {
    sudo pacman -S qutebrowser
}

eval $1
