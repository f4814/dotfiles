#!/bin/sh

list_supported() {
    echo "arch"
}

install_arch() {
    sudo pacman -S base-devel openssl zlib xz
    install_common
}

install_common() {
    # Pyenv
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshenv
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshenv
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshenv

    source ~/.zshenv

    # Pyenv-virtualenv
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshenv
}
