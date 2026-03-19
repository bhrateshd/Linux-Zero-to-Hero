#!/bin/bash

SERVER="nginx"

if systemctl is-active  --quiet "$SERVICE"; then
    echo "$SERVICE is Running."
else
    echo "$SERVICE is DOWN. Restarting..."
    systemctl restart "$SERVICE"
    sleep 5
    if systemctl is-active  --quiet "$SERVICE"; then
        echo "$SERVICE restarted successfully."
    else
        echo "CRITICAL: $SERVICE failed to restart. Paging on-call." >&2
        exit 1
    fi
fi