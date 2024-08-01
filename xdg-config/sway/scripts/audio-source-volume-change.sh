#!/usr/bin/env bash

# verifica o parâmetro
if [[ -z "$1" ]]; then
    exit 1
elif [[ -z "$(echo $1 | egrep '^[\+|\-]?[0-9]+$')" ]]; then
    exit 1
fi

# obtém o id do dispositivo de saída de áudio
DEVICE_ID=$(
    pw-dump Node | jq '.[].info | select(.state == "running") | .props | select(."media.class" == "Audio/Source") | ."device.id"'
)

if [[ -z $DEVICE_ID ]]; then
    exit 0
fi

ROUTE_INDEX=$(
    pw-dump $DEVICE_ID | jq '.[].info.params.Route.[] | select(.direction == "Input") | .index'
)

ROUTE_DEVICE=$(
    pw-dump $DEVICE_ID | jq ".[].info.params.Route.[] | select(.index == $ROUTE_INDEX) | .device"
)

# obtém o volume (de 0 a 100) do dispositivo de áudio
VOLUME=$(
    pw-dump $DEVICE_ID | jq ".[].info.params.Route.[] | select(.index == $ROUTE_INDEX) | .props.channelVolumes[0] | cbrt * 100 | floor"
)

# calcula o novo volume
NEW_VOLUME=$1
if [[ ! -z "$(echo $1 | egrep '^[\+|\-]')" ]]; then
    NEW_VOLUME=$(echo $VOLUME | jq "(. $1)")
fi

# limita o volume entre 0 e 100
NEW_VOLUME=$(
    echo $NEW_VOLUME | jq ". | if . > 100 then 100 elif . < 0 then 0 else . end"
)
NEW_VOLUME_PIPEWIRE=$(
    echo $NEW_VOLUME | jq '. / 100 | pow(.; 3)'
)

PIPEWIRE_PAYLOAD="{
    \"index\": $ROUTE_INDEX,
    \"device\": $ROUTE_DEVICE,
    \"props\": {
        \"channelVolumes\": [$NEW_VOLUME_PIPEWIRE, $NEW_VOLUME_PIPEWIRE],
        \"mute\": false
    }
}"

# atualiza o volume
pw-cli set-param $DEVICE_ID Route $PIPEWIRE_PAYLOAD > /dev/null
echo $NEW_VOLUME