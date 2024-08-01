#!/usr/bin/env bash

# inicializa o escaneamento de dispositivos
bluetoothctl scan on
sleep 2

DEVICES=$(bluetoothctl devices | awk '{print $2}')

SELECTOR=""
for DEVICE in $DEVICES; do
    DEVICE_NAME=$(bluetoothctl info $DEVICE | grep 'Name:')

    SELECTOR="$SELECTOR\n[$DEVICE] ${DEVICE_NAME:7}"
done

SELECTED=$(
    echo -e $SELECTOR | tofi --prompt-text 'Selecione o dispositivo:'
)

SELECTED_UUID=$(echo $SELECTED | egrep -o '..:..:..:..:..:..')

bluetoothctl connect $SELECTED_UUID
