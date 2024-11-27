#!/usr/bin/bash

# verifica o parâmetro
if [[ -z "$1" ]]; then
    exit 1
elif [[ -z "$(echo $1 | egrep '^[\+|\-]?[0-9]+$')" ]]; then
    exit 1
fi

payload=($(pw-dump | jq -c --arg value $1 '
  . | [.[] | select(.type == "PipeWire:Interface:Metadata")] as $meta
  | [.[] | select(.type == "PipeWire:Interface:Node")] as $node
  | [.[] | select(.type == "PipeWire:Interface:Device")] as $dev

  # seleciona o source padrão
  | $meta | .[] | select(.props."metadata.name" == "default")
    | .metadata[] | select(.key == "default.audio.source") | .value.name as $dev_name

  # obtém o id do dispositivo de áudio utilizado como padrão
  | $node | .[] | .info.props | select(."node.name" == $dev_name)
    | ."device.id" as $dev_id
    | ."card.profile.device" as $route_dev

  # obtém as informações do dispositivo de áudio
  | $dev | .[] | select(.id == $dev_id)
    | .info.params.Route | .[] | select(.device == $route_dev)
      | .index as $route_idx
      # obtém o volume atual do dispositivo
      | .props.channelVolumes[0] | cbrt * 100 | floor as $vol

  # processa o parâmetro para obter o novo volume
  | $value | match("^[+|-]?([0-9]+)$") | .captures
    | .[] | .string | tonumber as $new_value
  | $value
    | if test("^[+]") then
      ($vol + $new_value)
    elif test("^[-]") then
      ($vol - $new_value)
    else
      $new_value
    end
    | if . > 100 then 100 elif . < 0 then 0 else . end
    | . as $new_vol_percent
    | pow((. / 100); 3) as $new_vol

  # monta o payload utilizado para alterar o volume
  | $dev_id, $new_vol_percent, {
    index: $route_idx,
    device: $route_dev,
    props: {
      channelVolumes: [$new_vol, $new_vol],
      mute: false,
    }
  }
'))

pw-cli set-param ${payload[0]} Route ${payload[2]} > /dev/null
echo ${payload[1]}
