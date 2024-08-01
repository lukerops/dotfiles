#!/usr/bin/env bash

# verifica o parâmetro
if [[ -z "$1" ]]; then
    exit 1
elif [[ -z "$(echo $1 | egrep '^[\+|\-]?[0-9]+$')" ]]; then
    exit 1
fi

BACKLIGHT=$(ls /sys/class/backlight/ | head -n 1)

if [[ -z $BACKLIGHT ]]; then
    exit 0
fi

MAX_VALUE=$(cat /sys/class/backlight/$BACKLIGHT/max_brightness)
VALUE=$(cat /sys/class/backlight/$BACKLIGHT/brightness | jq ". / $MAX_VALUE | . * 100 | floor")

NEW_VALUE=$1
if [[ ! -z "$(echo $1 | egrep '^[\+|\-]')" ]]; then
    NEW_VALUE=$(echo $VALUE | jq "(. $1)")
fi

NEW_VALUE=$(
    echo $NEW_VALUE | jq ". | if . > 100 then 100 elif . < 0 then 0 else . end"
)

echo $NEW_VALUE | jq "(. / 100) * $MAX_VALUE | floor" > /sys/class/backlight/$BACKLIGHT/brightness
echo $NEW_VALUE
