#!/usr/bin/bash

DESKTOP=$1

# atualiza o sistema
sudo apt update
sudo apt upgrade -y

# instala o core do sistema
sudo apt install $(cat ./distro/pkgs/core.system.debian.pkgs | xargs)

# adiciona o usuário ao grupo de sudo
# usermod -aG sudo $TARGET_USER

# gera as pastas básicas na home
sh -c 'cd $HOME && xdg-user-dirs-update'

# habilita a ethernet no network manager
sudo sed -i 's/managed=false/managed=true/g' /etc/NetworkManager/NetworkManager.conf

# habilita o flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# instala os pacotes de audio
sudo apt install $(cat ./distro/pkgs/pipewire.audio.debian.pkgs | xargs)

# habilita o audio para o usuário
systemctl --user daemon-reload
systemctl --user enable --now \
    wireplumber.service \
    pipewire.service \
    pipewire-pulse.service

# instala o wifi se encontrar uma placa de rede
if [[ $(lspci | egrep -i 'wifi|wireless') ]]; then
    sudo apt install $(cat ./distro/pkgs/wireless.system.debian.pkgs | xargs)
fi

# instala o bluetooth se encontrar uma placa de rede
if [[ $(lsusb | egrep -i 'bluetooth') ]]; then
    sudo apt install $(cat ./distro/pkgs/bluetooth.system.debian.pkgs | xargs)
fi

# instala o gnome se for o desktop escolhido
if [[ $DESKTOP == 'gnome' ]]; then
    sudo apt install $(cat ./distro/pkgs/gnome.desktop.debian.pkgs | xargs)
fi

# instala o sway se for o desktop escolhido
if [[ $DESKTOP == 'sway' ]]; then
    sudo apt install $(cat ./distro/pkgs/sway.desktop.debian.pkgs | xargs)

    # cria link simbólico com as configurações
    mkdir -p $HOME/.config
    for app in $(ls ./xdg-config); do
        [[ ! -L $(pwd)/xdg-config/$app ]] && ln -s $(pwd)/xdg-config/$app $HOME/.config/
    done

    # habilita o usuário de mudar o brilho
    sudo usermod -aG video $USER
fi

# instala o firefox
if [[ $(apt-cache search --names-only '^firefox-esr$') ]]; then
    sudo apt install firefox-esr firefox-esr-l10n-pt-br webext-ublock-origin-firefox webext-privacy-badger
else
    . ./distro/apps/firefox.sh
fi
