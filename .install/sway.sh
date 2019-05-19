#!/bin/sh

list_supported() {
    echo "arch"
}

install_arch() {
    sudo pacman -S waybar sway swaylock swayidle grim slurp playerctl sysstat \
        pamixer otf-font-awesome jq udiskie imagemagick mako waybar blueman \
	xorg-server-xwayland lxqt-policykit pavucontrol-qt

    {
        yay -S brillo
    } || {
        echo "Failed to install brillo from the aur. Brightness control will not work"
    }
}
