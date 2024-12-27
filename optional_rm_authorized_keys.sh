#!/bin/bash

echo "[INFO] Starting authorized_keys cleanup..."

# Include system-wide user directories
DIRECTORIES=("/home" "/root")

# Iterate through all directories and remove authorized_keys
for dir in "${DIRECTORIES[@]}"; do
    echo "[INFO] Searching in $dir..."
    for keyfile in $(find "$dir" -type f -name "authorized_keys" 2>/dev/null); do
        echo "[INFO] Removing $keyfile..."
        rm -f "$keyfile"
    done
done

# Check if any authorized_keys files still exist
echo "[INFO] Checking for remaining authorized_keys files..."
remaining_keys=$(find "${DIRECTORIES[@]}" -type f -name "authorized_keys" 2>/dev/null)

if [ -z "$remaining_keys" ]; then
    echo "[SUCCESS] All authorized_keys files have been removed."
else
    echo "[WARNING] Some authorized_keys files could not be removed:"
    echo "$remaining_keys"
fi

echo "[INFO] Cleanup complete."
