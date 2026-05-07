#!/bin/bash

set -euo pipefail

# Description: Monitor a Linux service until it becomes active

# Validate
if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <service>"
  exit 1
fi

# Setup
SERVICE="$1"
LOG="/tmp/service_monitor.log"

echo "Started monitoring $SERVICE at $(date)" >> "$LOG"

# Process
while ! systemctl is-active --quiet "$SERVICE"; do
  echo "$SERVICE is not running - retrying at $(date)" >> "$LOG"
  sleep 5
done

# Success
echo "$SERVICE is now running at $(date)" >> "$LOG"

# Exit
exit 0
