#!/bin/bash

# Set the DBUS_SESSION_BUS_ADDRESS environment variable
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus

# Specify the full path to nmcli
NMCLI=/usr/bin/nmcli

status=$($NMCLI -t -f WIFI nm)

if [ "$status" = "enabled" ] ; then
    if sudo $NMCLI radio wifi off; then
        echo "Wireless disabled"
    else
        echo "Failed to disable wireless"
    fi
else
    if sudo $NMCLI radio wifi on; then
        echo "Wireless enabled"
    else
        echo "Failed to enable wireless"
    fi
fi

exit 0
