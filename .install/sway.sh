#!/bin/sh

list_supported() {
    echo "arch"
}

install_arch() {
    sudo pacman -S waybar sway swaylock swayidle grim slurp playerctl sysstat \
        pamixer otf-font-awesome perl-mimeinfo jq udiskie imagemagick mako \
            waybar blueman

    {
        yay -S brillo
    } || {
        echo "Failed to install brillo from the aur. Brightness control will not work"
    }
}
