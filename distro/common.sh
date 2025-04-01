#!/usr/bin/bash

# Instala as fontes customizadas
TMPFILE=$(mktemp)
mkdir -p "$HOME/.local/share/fonts"

if [[ ! -d "$HOME/.local/share/fonts/JetBrainsMono" ]]; then
    wget -O $TMPFILE 'https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip'
    unzip -d "$HOME/.local/share/fonts/JetBrainsMono" $TMPFILE
fi

if [[ ! -d "$HOME/.local/share/fonts/ZedMono" ]]; then
    wget -O $TMPFILE 'https://github.com/ryanoasis/nerd-fonts/releases/latest/download/ZedMono.zip'
    unzip -d "$HOME/.local/share/fonts/ZedMono" $TMPFILE
fi

rm $TMPFILE

if [[ $DESKTOP == 'gnome' ]]; then
    flatpak install flathub $(cat ./distro/pkgs/gnome.desktop.flatpak.pkgs | xargs)
fi
