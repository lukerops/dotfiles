#!/usr/bin/bash

distro_install() {
    # atualiza o sistema
    sudo apt update
    # sudo apt upgrade -y

    # instala o core do sistema
    sudo apt install --no-install-suggests --no-install-recommends $(cat ./distro/pkgs/*core.system.debian.pkgs | xargs)

    # adiciona o usuário ao grupo de sudo
    # usermod -aG sudo $TARGET_USER

    # gera as pastas básicas na home
    sh -c 'cd $HOME && xdg-user-dirs-update'

    # habilita a ethernet no network manager
    sudo sed -i 's/managed=false/managed=true/g' /etc/NetworkManager/NetworkManager.conf

    # habilita o flathub
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    # instala os pacotes de audio
    sudo apt install --no-install-suggests --no-install-recommends $(cat ./distro/pkgs/pipewire.audio.debian.pkgs | xargs)

    # habilita o audio para o usuário
    systemctl --user daemon-reload
    systemctl --user enable --now wireplumber.service pipewire.socket pipewire-pulse.socket

    # instala o wifi se encontrar uma placa de rede
    if [[ $(lspci | egrep -i 'wifi|wireless') ]]; then
        sudo apt install --no-install-suggests --no-install-recommends $(cat ./distro/pkgs/wireless.system.debian.pkgs | xargs)
    fi

    # instala o bluetooth se encontrar uma dispositivo bluetooth
    if [[ $(lsusb | egrep -i 'bluetooth') ]]; then
        sudo apt install --no-install-suggests --no-install-recommends $(cat ./distro/pkgs/bluetooth.system.debian.pkgs | xargs)
    fi

    # instala o gnome se for o desktop escolhido
    if [[ $DESKTOP == 'gnome' ]]; then
        sudo apt install --no-install-suggests --no-install-recommends $(cat ./distro/pkgs/gnome.desktop.debian.pkgs | xargs)

        # configura o leitor de impressão digital
        # sudo pam-auth-update --enable fprintd
    fi

    # instala o sway se for o desktop escolhido
    if [[ $DESKTOP == 'sway' ]]; then
        sudo apt install --no-install-suggests --no-install-recommends $(cat ./distro/pkgs/sway.desktop.debian.pkgs | xargs)

        # cria link simbólico com as configurações
        mkdir -p $HOME/.config
        for app in $(ls ./xdg-config); do
            [[ ! -L $HOME/.config/$app ]] && ln -s $(pwd)/xdg-config/$app $HOME/.config/
        done

        # configura o tlp
        for config in $(ls ./tlp); do
            [[ ! -L /etc/tlp.d/$config ]] && sudo ln -s $(pwd)/tlp/$config /etc/tlp.d/
        done
        sudo systemctl enable --now tlp.service

        # habilita o usuário de mudar o brilho
        sudo usermod -aG video $USER
    fi
}

distro_uninstall() {
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
}
