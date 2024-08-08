#!/usr/bin/bash

STATUS=$($HOME/.config/yambar/scripts/netskope-status.sh | cut -d'|' -f3)

if [[ $STATUS == 'Stoped' ]]; then
    sudo systemctl start stagentd.service
    systemctl --user start stagentapp.service
else
    sudo systemctl stop stagentd.service
    systemctl --user stop stagentapp.service
    pkill stAgentUI
fi
