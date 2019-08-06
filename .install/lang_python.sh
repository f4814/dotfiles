#!/bin/sh

list_supported() {
    echo "arch debian rasbian"
}

install_arch() {
    sudo pacman -S base-devel openssl zlib xz
    install_common
}

install_debian() {
    sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

    install_common
}

install_raspbian() {
    install_debian
}

install_gentoo() {
    sudo emerge --ask --noreplace dev-lang/python

    install_common
}

install_common() {
    # Pyenv
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshenv
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshenv
    echo 'if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi' >> ~/.zshenv

    . ~/.zshenv

    # Pyenv-virtualenv
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshenv
}

eval $1
