#!/usr/bin/bash

pw-dump Node | jq '[.[] | .info.props | select(."node.name" == "xdg-desktop-portal-wlr")] | length'
