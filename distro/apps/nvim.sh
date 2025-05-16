#!/usr/bin/bash

# cria uma pasta temporária
TMPDIR=$(mktemp -d)
NVIM_FILENAME='nvim-linux-x86_64'

# Faz o donwload da versão estável mais recente do neovim
wget --directory-prefix $TMPDIR --relative "https://github.com/neovim/neovim/releases/download/stable/${NVIM_FILENAME}.tar.gz"

# Remove versão anterior do neovim
sudo rm -rf /opt/nvim

# Extraí o arquivo baixado na pasta /opt
tar --extract --gzip --directory=$TMPDIR --file=$TMPDIR/$NVIM_FILENAME.tar.gz

# Renomeia a pasta para /opt/nvim
sudo mv $TMPDIR/$NVIM_FILENAME /opt/nvim

# Cria um link simbólico para o executável
[[ ! -L /usr/local/bin/nvim ]] && sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/

# Remove a pasta temporária
rm -rf $TMPDIR
