#!/usr/bin/bash

# cria uma pasta temporária
TMPDIR=$(mktemp -d)
FILENAME='fnm.zip'

# Busca o link da versão mais recente
URL='https://github.com/Schniz/fnm/releases/latest/download/fnm-linux.zip'

# Faz o download da versão estável mais recente
wget --output-document $TMPDIR/$FILENAME $URL

# Extraí o arquivo baixado na pasta
unzip $TMPDIR/$FILENAME -d $TMPDIR

# Instala o software
sudo mv $TMPDIR/fnm /usr/local/bin/

# Garante as permissões corretas
sudo chmod +x /usr/local/bin/fnm

# Remove a pasta temporária
rm -rf $TMPDIR
