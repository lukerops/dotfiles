#!/usr/bin/bash

# cria uma pasta temporária
tmp=$(mktemp -d)

# Faz o donwload da versão mais recente do firefox
wget --directory-prefix $tmp --relative --trust-server-names 'https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=pt-BR'

# Remove versão anterior do Firefox
sudo rm -rf /opt/firefox

# Extraí o arquivo baixado na pasta /opt
sudo tar --extract --bzip2 --directory /opt --file $tmp/firefox-*.tar.bz2

# Cria um link simbólico para o executável do Firefox
[[ ! -L /usr/local/bin/firefox ]] && sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox

# Adiciona atalho no sistema
[[ ! -f /usr/local/share/applications/firefox.desktop ]] && sudo cp ./firefox.desktop /usr/local/share/applications/

# Move os arquivos das instalações anteriores
if [[ -d $HOME/.var/app/org.mozilla.firefox ]]; then
    cp -a $HOME/.var/app/org.mozilla.firefox/.mozilla $HOME/.mozilla

    echo 'Execute o firefox pela primeira vez pelo terminal usando "firefox -P"'
fi

# Remove a pasta temporária
rm -rf $tmp
