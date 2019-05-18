#!/bin/sh

set -e

# Detect running os/distro. I am using:
# arch, debian, ubuntu
detect_os() {
    awk -F= '$1=="ID" { print $2 ;}' /etc/os-release
}

# $1: program
# $2: os
install() {
    source .install/$1.sh

    { # Try distro install
        set -x
        eval install_$2
    } || {
        echo "Unable to install for distro $1"
        echo "Supported distros: $(list_supported)"
    }

    stow $1
}

if [ $# -eq 1 ]; then
    os=$(detect_os)
elif [ $# -eq 2 ]; then
    echo "Forcing $1 install for $1"
    os=$2
fi

install $1 $os
