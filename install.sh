#!/usr/bin/bash

distro=$(cat /etc/os-release | grep -P '^ID=(.*)' | sed -r 's/ID=(.*)/\1/g')

. "./distro/${distro}.sh"
