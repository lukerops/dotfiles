#!/usr/bin/bash

con_id=($(
    swaymsg --raw --type get_tree | \
        jq -r 'recurse(.nodes[]) | select(.type == "con") | select(.layout == "none") | "\(.id) - \(.name)"' | \
        tofi --config ~/.config/tofi/application-switch.conf
))

swaymsg "[con_id=$con_id] focus"
