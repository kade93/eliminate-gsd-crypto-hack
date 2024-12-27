#!/bin/bash

echo "[INFO] Starting gsd cleanup..."

# Define directories to search
SEARCH_DIRS=(
    "/usr/local/src"
    "/tmp"
    "/var/tmp"
    "/dev/shm"
    "/home"
    "/root"
)

# Define patterns to match
PATTERNS=(
    "*.gsd"
    "gsd"
)

# Find and remove matching files
for dir in "${SEARCH_DIRS[@]}"; do
    echo "[INFO] Searching in $dir..."
    for pattern in "${PATTERNS[@]}"; do
        find "$dir" -type f -name "$pattern" 2>/dev/null | while read -r file; do
            echo "[INFO] Removing $file..."
            chattr -i "$file" 2>/dev/null   # Remove immutable attribute if set
            rm -f "$file"
        done
    done
done

# Check if any gsd files still exist
echo "[INFO] Checking for remaining gsd files..."
remaining_files=$(find "${SEARCH_DIRS[@]}" -type f \( -name "*.gsd" -o -name "gsd" \) 2>/dev/null)

if [ -z "$remaining_files" ]; then
    echo "[SUCCESS] All gsd files have been removed."
else
    echo "[WARNING] Some gsd files could not be removed:"
    echo "$remaining_files"
fi

echo "[INFO] Cleanup complete."
