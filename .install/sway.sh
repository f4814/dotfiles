#!/bin/sh

list_supported() {
    echo "arch"
}

install_arch() {
    sudo pacman -S sway swaylock swayidle grim slurp \
        otf-font-awesome jq mako sysstat \
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
        media-sound/pavucontrol-qt x11-misc/i3blocks x11-misc/rofi

    echo "You have to install a supported terminal emulator."
    echo "Currently thats either termite or kitty"
}

eval $1
