#!/bin/bash

wifi_interface="wlp60s0"
target_host="8.8.8.8"
network_manager_service="NetworkManager"
log_file="./wifi_check.log"

wifi_status=""

while true; do
    if ping -c 1 $target_host >/dev/null 2>&1; then
        if [ "$wifi_status" != "up" ]; then
            echo "$(date): WiFi is up." >> $log_file
            wifi_status="up"
        fi
    else
        if [ "$wifi_status" != "down" ]; then
            echo "$(date): WiFi is down. Reconnecting..." >> $log_file
            sudo service $network_manager_service restart           
            wifi_status="down"
        fi
    fi

    sleep 180
done
