#!/usr/bin/env bash

# seleciona o aplicativo a ser aberto
APPLICATION=$(fuzzel)

# executa o software através do sway
swaymsg exec "$APPLICATION"

exit 0
