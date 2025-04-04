#!/usr/bin/bash

if [[ $(swaymsg  -t get_outputs | jq '. | length') > 1 ]]; then
    swaymsg output eDP-1 disable

    pkill yambar
    swaymsg exec yambar
else
    systemctl suspend
fi
