#!/bin/bash

function extension() {
    echo $(flatpak info --show-sdk io.neovim.nvim | sed "s/Sdk/Sdk.Extension.$1/")
}

# instala o Neovim via flatpak
flatpak install -y flathub io.neovim.nvim

# instala as extensões
flatpak install -y $(extension golang)

# modifica algumas configurações
flatpak --user override \
    --socket=gpg-agent \
    --socket=ssh-auth \
    --env=SHELL=/usr/bin/bash \
    --env=FLATPAK_ENABLE_SDK_EXT=golang \
    --nofilesystem=host \
    --nofilesystem=/tmp \
    --nofilesystem=/var/tmp \
    --filesystem=~/git \
    --filesystem=~/.gitconfig \
    --persist=.bashrc \
    --persist=.bash_history \
    --persist=.ssh \
    --persist=.pyenv \
        io.neovim.nvim

# cria as pastas que vamos copiar os arquivos
mkdir -p ~/.var/app/io.neovim.nvim/config/ ~/.var/app/io.neovim.nvim/data/nvim/mason/bin/

# adiciona a config do nvim
[ ! -L $HOME/.var/app/io.neovim.nvim/config//nvim ] && ln -s $(pwd)/xdg-config/nvim $HOME/.var/app/io.neovim.nvim/config/
