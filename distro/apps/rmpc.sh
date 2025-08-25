#!/usr/bin/bash

# cria uma pasta temporária
TMPDIR=$(mktemp -d)
FILENAME='rmpc'

# Busca o link da versão mais recente
URL=$(curl "https://api.github.com/repos/mierak/rmpc/releases/latest" | \
	jq -r '.assets[] | select(.name | contains("x86_64-unknown-linux-gnu")) | .browser_download_url')

# Faz o download da versão estável mais recente
wget --output-document $TMPDIR/$FILENAME.tar.gz $URL

# Extraí o arquivo baixado na pasta /opt
tar --extract --gzip --directory=$TMPDIR --file=$TMPDIR/$FILENAME.tar.gz

# Instala o software
sudo mv $TMPDIR/rmpc /usr/local/bin/

# Remove a pasta temporária
rm -rf $TMPDIR
