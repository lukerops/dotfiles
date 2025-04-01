#!/usr/bin/bash

# desinstala o gnome se for o desktop escolhido
if [[ $DESKTOP == 'gnome' ]]; then
    sudo apt purge $(cat ./distro/pkgs/gnome.desktop.debian.pkgs | xargs)
fi

# desinstala o sway se for o desktop escolhido
if [[ $DESKTOP == 'sway' ]]; then
    sudo apt purge $(cat ./distro/pkgs/sway.desktop.debian.pkgs | xargs)

    # remove link simbólico com as configurações
    for app in $(ls ./xdg-config); do
        [[ -L $HOME/.config/$app ]] && rm $HOME/.config/$app
    done
fi

sudo apt autopurge
