#!/usr/bin/env bash

DEVICE_ID=$(
    pw-dump Node | jq '.[].info | select(.state == "running") | .props | select(."media.class" == "Audio/Source") | ."device.id"'
)

if [[ -z $DEVICE_ID ]]; then
    exit 0
fi

echo $DEVICE_ID

ROUTE_INDEX=$(
    pw-dump $DEVICE_ID  | jq '.[].info.params.Route.[] | select(.direction == "Input") | .index'
)

ROUTE_DEVICE=$(
    pw-dump $DEVICE_ID  | jq ".[].info.params.Route.[] | select(.index == $ROUTE_INDEX) | .device"
)

MUTE=$(
    pw-dump $DEVICE_ID  | jq ".[].info.params.Route.[] | select(.index == $ROUTE_INDEX) | .props.mute | not"
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
