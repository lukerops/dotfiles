#!/usr/bin/env bash

# obtém o nome do dispositivo de saída de áudio padrão
DEVICE_NAME=$(
    pw-dump Metadata | jq -r '.[] | select(.props."metadata.name" == "default") | .metadata[] | select(.key == "default.audio.sink") | .value.name'
)

# obtém o id do dispositivo de saída de áudio
DEVICE_ID=$(
    pw-dump Node | jq -r ".[].info.props | select(.\"node.name\" == \"$DEVICE_NAME\") | .\"device.id\""
)

ROUTE_INDEX=$(
    pw-dump $DEVICE_ID  | jq -r '.[].info.params.Route.[] | select(.direction == "Output") | .index'
)

ROUTE_DEVICE=$(
    pw-dump $DEVICE_ID  | jq -r ".[].info.params.Route.[] | select(.index == $ROUTE_INDEX) | .device"
)

MUTE=$(
    pw-dump $DEVICE_ID  | jq -r ".[].info.params.Route.[] | select(.index == $ROUTE_INDEX) | .props.mute | not"
)

PIPEWIRE_PAYLOAD="{
    \"index\": $ROUTE_INDEX,
    \"device\": $ROUTE_DEVICE,
    \"props\": {
        \"mute\": $MUTE
    }
}"

# atualiza o volume
pw-cli set-param $DEVICE_ID Route $PIPEWIRE_PAYLOAD > /dev/null
