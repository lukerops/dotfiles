#!/usr/bin/bash

# Remove os pacotes flatpak
if [[ $DESKTOP == 'gnome' ]]; then
    flatpak uninstall --delete-data $(cat ./distro/pkgs/gnome.desktop.flatpak.pkgs | xargs)
fi
