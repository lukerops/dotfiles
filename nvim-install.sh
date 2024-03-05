#!/bin/bash

# instala o Neovim via flatpak
flatpak install flathub io.neovim.nvim

# modifica algumas configurações
flatpak --user override \
    --env=SHELL=/usr/bin/bash \
    --nofilesystem=host \
    --filesystem=~/git \
        io.neovim.nvim

# cria as pastas que vamos copiar os arquivos
mkdir -p ~/.var/app/io.neovim.nvim/config/ ~/.var/app/io.neovim.nvim/data/nvim/mason/bin/

# adiciona a config do nvim
ln -s $(pwd)/nvim ~/.var/app/io.neovim.nvim/config/
