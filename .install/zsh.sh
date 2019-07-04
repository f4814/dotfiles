#!/bin/sh

list_supported() {
    echo "arch, debian, raspbian"
}

install_arch() {
    sudo pacman -S fd zsh zsh-syntax-highlighting
    install_common
}

install_debian() {
	sudo aptitude install zsh silversearcher-ag fd-find
        install_common
}

install_raspbian() {
	install_debian
        install_common
}

install_gentoo() {
	sudo emerge --ask app-shells/zsh app-shells/gentoo-zsh-completions \
            app-shells/zsh-completions sys-apps/fd sys-apps/the_silver_searcher
        install_common
}

install_common() {
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --bin
    mkdir -p ~/.local/bin
    cp ~/.fzf/bin/fzf ~/.local/bin/
}


eval $1
