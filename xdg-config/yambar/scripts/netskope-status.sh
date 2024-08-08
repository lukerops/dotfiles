#!/usr/bin/bash

NETSKOPE_CLIENT="/opt/netskope/stagent/stAgentCli"
[[ ! -f $NETSKOPE_CLIENT ]] && exit 0

STATUS=$(
    $NETSKOPE_CLIENT show-pa | awk '
        /^ERROR: Failed to connect/ { print "Stoped" }
        /^ERROR: Netskope Client has been disconnected/ { print "Initializing" }
        /^Status:/ { print $2 }
    '
)

echo "status|string|$STATUS"
echo
