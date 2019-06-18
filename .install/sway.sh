#!/bin/sh

list_supported() {
    echo "arch"
}

install_arch() {
    sudo pacman -S sway swaylock swayidle grim slurp \
        otf-font-awesome jq mako \
	xorg-server-xwayland lxqt-policykit pavucontrol-qt

    {
        yay -S brillo
    } || {
        echo "Failed to install brillo from the aur. Brightness control will not work"
    }
}

install_gentoo() {
    sudo emerge --ask gui-wm/sway gui-apps/swaylock gui-apps/swayidle \
        gui-apps/swaybg gui-apps/mako app-misc/jq media-fonts/fontawesome \
        media-sound/pavucontrol-qt x11-misc/i3blocks

    echo "Termite is not in the Gentoo repositories. Install another terminal emulator"
    echo "and symlink ~/.local/bin/termite to it"
}

eval $1
