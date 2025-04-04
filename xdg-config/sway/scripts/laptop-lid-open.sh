#!/usr/bin/bash

swaymsg output eDP-1 enable

pkill yambar
swaymsg exec yambar
