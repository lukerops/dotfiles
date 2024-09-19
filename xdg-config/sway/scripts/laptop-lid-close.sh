#!/usr/bin/bash

if [[ $(swaymsg  -t get_outputs | jq '. | length') > 1 ]]; then
    swaymsg output eDP-1 disable
else
    systemctl suspend
fi
