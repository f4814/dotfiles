#!/bin/sh

list_supported() {
    echo "Most UNIX"
}

install_arch() {
    curl -sSL https://get.haskellstack.org/ | sh
}
