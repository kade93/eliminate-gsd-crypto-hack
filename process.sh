#!/bin/bash

# 악성 프로세스 이름
PROCESS_NAMES=(
  "pwnrig"
  "gsd"
)

echo "[INFO] Killing running processes..."
for PROC_NAME in "${PROCESS_NAMES[@]}"; do
  while pgrep "$PROC_NAME" > /dev/null; do
    pkill -9 "$PROC_NAME"
    echo "[INFO] Process $PROC_NAME terminated."
    sleep 1
  done
done

