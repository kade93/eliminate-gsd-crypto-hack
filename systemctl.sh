#!/bin/bash

# Systemd Services
SERVICES=(
  "pwnrige.service"
  "pwnrigl.service"
)

echo "[INFO] Stopping and disabling systemd services..."
for SERVICE in "${SERVICES[@]}"; do
  if systemctl list-units --full -all | grep -q "$SERVICE"; then
    systemctl stop "$SERVICE" 2>/dev/null
    systemctl disable "$SERVICE" 2>/dev/null
    echo "[INFO] Service $SERVICE stopped and disabled."
  else
    echo "[INFO] Service $SERVICE not found."
  fi
done

# Systemctl reload daemon
echo "[INFO] Reloading systemctl daemon..."
systemctl daemon-reload

