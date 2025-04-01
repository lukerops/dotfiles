#!/usr/bin/bash

STATUS=$(pw-dump Node | jq '[.[] | .info.props | select(."node.name" == "xdg-desktop-portal-wlr")] | length')

if [[ $STATUS == 0 ]]; then
    echo "status|string|NotSharing"
else
    echo "status|string|Sharing"
fi
echo
