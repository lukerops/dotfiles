#!/usr/bin/bash

# cria uma pasta temporária
TMPDIR=$(mktemp -d)
FILENAME='nvim.tar.gz'

# Busca o link da versão mais recente
URL='https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz'

# Faz o download da versão estável mais recente
wget --output-document $TMPDIR/$FILENAME $URL

# Remove versão anterior do neovim
sudo rm -rf /opt/nvim

# Extraí o arquivo baixado na pasta
tar --extract --gzip --directory=$TMPDIR --file=$TMPDIR/$FILENAME

# Move a pasta para /opt/nvim
sudo mv $TMPDIR/nvim-linux-x86_64 /opt/nvim

# Cria um link simbólico para o executável
[[ ! -L /usr/local/bin/nvim ]] && sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/

# Remove a pasta temporária
rm -rf $TMPDIR
