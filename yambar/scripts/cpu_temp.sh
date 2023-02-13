#!/bin/sh

TEMP=$(cat /sys/class/thermal/thermal_zone7/temp | awk '{print $1 / 1000}')
echo "temp|int|$TEMP"
echo
