#!/usr/bin/bash

install_fonts() {
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
}

common_install() {
    if [[ $DESKTOP == 'gnome' ]]; then
        flatpak install flathub $(cat ./distro/pkgs/gnome.desktop.flatpak.pkgs | xargs)
    fi
}

common_uninstall() {
    # Remove os pacotes flatpak
    if [[ $DESKTOP == 'gnome' ]]; then
        flatpak uninstall --delete-data $(cat ./distro/pkgs/gnome.desktop.flatpak.pkgs | xargs)
    fi
}

DESKTOP=${2:-sway}
distro=$(cat /etc/os-release | grep -P '^ID=(.*)' | sed -r 's/ID=(.*)/\1/g')

. "./distro/distro/${distro}.sh"

case $1 in
    install)
        install_fonts
        common_install
        distro_install
        ;;

    uninstall)
        common_uninstall
        distro_uninstall
        ;;
esac
