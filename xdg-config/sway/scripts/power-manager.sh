#!/usr/bin/env bash

TEXT='Opções de Energia:'
SHUTDOWN='Desligar'
REBOOT='Reiniciar'
SUSPEND='Suspender'

# pergunta qual a ação desejada
SELECTED=$(
    echo -e "$SUSPEND\n$REBOOT\n$SHUTDOWN\n" | tofi --prompt-text "$TEXT"
)

[[ "$SELECTED" == "$SHUTDOWN" ]] && systemctl poweroff
[[ "$SELECTED" == "$REBOOT" ]] && systemctl reboot
[[ "$SELECTED" == "$SUSPEND" ]] && systemctl suspend

exit 0
