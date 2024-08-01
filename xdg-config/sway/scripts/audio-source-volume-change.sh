#!/usr/bin/env bash

# verifica o parâmetro
if [[ -z "$1" ]]; then
    exit 1
elif [[ -z "$(echo $1 | egrep '^[\+|\-]?[0-9]+$')" ]]; then
    exit 1
fi

# obtém o nome do dispositivo de entrada de áudio padrão
DEVICE_NAME=$(
    pw-dump Metadata | jq -r '.[] | select(.props."metadata.name" == "default") | .metadata[] | select(.key == "default.audio.source") | .value.name'
)

# obtém o id do dispositivo de entrada de áudio
DEVICE_ID=$(
    pw-dump Node | jq -r ".[].info.props | select(.\"node.name\" == \"$DEVICE_NAME\") | .\"device.id\""
)

ROUTE_INDEX=$(
    pw-dump $DEVICE_ID | jq -r '.[].info.params.Route.[] | select(.direction == "Input") | .index'
)

ROUTE_DEVICE=$(
    pw-dump $DEVICE_ID | jq -r ".[].info.params.Route.[] | select(.index == $ROUTE_INDEX) | .device"
)

# obtém o volume (de 0 a 100) do dispositivo de áudio
VOLUME=$(
    pw-dump $DEVICE_ID | jq -r ".[].info.params.Route.[] | select(.index == $ROUTE_INDEX) | .props.channelVolumes[0] | cbrt * 100 | floor"
)

# calcula o novo volume
NEW_VOLUME=$1
if [[ ! -z "$(echo $1 | egrep '^[\+|\-]')" ]]; then
    NEW_VOLUME=$(echo $VOLUME | jq -r "(. $1)")
fi

# limita o volume entre 0 e 100
NEW_VOLUME=$(
    echo $NEW_VOLUME | jq -r ". | if . > 100 then 100 elif . < 0 then 0 else . end"
)
NEW_VOLUME_PIPEWIRE=$(
    echo $NEW_VOLUME | jq -r '. / 100 | pow(.; 3)'
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
