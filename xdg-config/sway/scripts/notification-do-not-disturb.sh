#!/usr/bin/env bash

enable_dnd() {
    makoctl mode -a 'do-not-disturb' > /dev/null
}

disable_dnd() {
    makoctl mode -r 'do-not-disturb' > /dev/null
}

is_dnd=$(makoctl mode | grep -c 'do-not-disturb')

if [[ $1 == 'get' ]]; then
    [[ $is_dnd == 1 ]] && echo true || echo false
elif [[ $1 == 'toggle' ]]; then
    [[ $is_dnd == 0 ]] && enable_dnd || disable_dnd
elif [[ $1 == 'enable' ]]; then
    [[ $is_dnd == 0 ]] && enable_dnd
elif [[ $1 == 'disable' ]]; then
    [[ $is_dnd == 1 ]] && disable_dnd
else
    exit 1
fi
