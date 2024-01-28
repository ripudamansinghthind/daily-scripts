#!/usr/bin/env bash
log_file="/opt/scripts/wifi_check.log"

while true; do
     if ! ping -c 1 google.com > /dev/null 2>&1; then
        echo "$(date): WiFi is down. Reconnecting..."

        nmcli device disconnect wlp60s0
        nmcli device wifi connect "ssid_name" password "ssid_password"

        # Log the reconnection status
        if ping -c 1 example.com > /dev/null 2>&1; then
            echo "$(date): Reconnected to WiFi." >> "$log_file"
        else
            echo "$(date): Failed to reconnect to WiFi." >> "$log_file"
        fi
    else
        # WiFi is up, log that it's up
        echo "$(date): WiFi is up." >> "$log_file"
    fi

    # Sleep for 3 minutes
    sleep 180
done

