#!/usr/bin/bash

# cria uma pasta temporária
tmp=$(mktemp -d)

# Faz o donwload da versão estável mais recente do neovim
wget --directory-prefix $tmp --relative 'https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz'

# Remove versão anterior do neovim
sudo rm -rf /opt/nvim

# Extraí o arquivo baixado na pasta /opt
sudo tar --extract --gzip --directory=$tmp --file=$tmp/nvim-linux64.tar.gz

# Move a pasta para /opt/nvim
sudo mv $tmp/nvim-linux64 /opt/nvim

# Cria um link simbólico para o executável
[[ ! -L /usr/local/bin/nvim ]] && sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/

# Remove a pasta temporária
rm -rf $tmp
