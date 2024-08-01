#!/usr/bin/env bash

# seleciona o aplicativo a ser aberto
APPLICATION=$(tofi-drun)

# executa o software através do sway
swaymsg exec "$APPLICATION"

exit 0
