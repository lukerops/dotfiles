#!/usr/bin/bash

if [[ $DESKTOP == 'gnome' ]]; then
    flatpak install flathub $(cat ./distro/pkgs/gnome.desktop.flatpak.pkgs | xargs)
fi
