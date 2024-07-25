#!/usr/bin/bash

TARGET_VERSION='noble'
VERSION=$(cat /etc/os-release | grep UBUNTU_CODENAME | cut -d'=' -f2)

# remove todos os pacotes instalados com o snap
if [[ $(command -v snap) ]]; then
    for pkg in $(snap list | tail -n +2 | cut -d' ' -f1); do
        snap remove --purge $pkg
    done
fi

sudo apt purge -y --auto-remove \
    snapd* \
    pulseaudio* \
    ubuntu-desktop* \
    ubuntu-standard \
    cups* \
    gnome* \
    xterm \
    byobu \
    zutty \
    ubuntu-server* \
    notification-daemon | tee -a $HOME/ubuntu-cleaned-packages.txt

# bloqueia o snapd de ser instalado novamente
cat <<EOF > /etc/apt/preferences.d/nosnap.pref
# Para evitar que os pacotes de repositório acionem a instalação do snap,
# este arquivo proíbe o snapd de ser instalado pelo APT.

Package: snapd
Pin: release a=*
Pin-Priority: -10
EOF

# remove ppas que vieram habilitadas
rm /etc/apt/sources.list.d/deadsnakes-ubuntu-ppa-jammy.list /etc/apt/sources.list.d/emoraes25-ubuntu-cid-jammy.list

# atualiza o sistema
sudo apt update
sudo apt upgrade -y

# atualiza os repositórios do apt para a versão desejada
if [[ $VERSION != $TARGET_VERSION ]]; then
    sed -i "s/$VERSION/$TARGET_VERSION/g" /etc/apt/sources.list

    sudo apt update
    sudo apt full-upgrade
fi
