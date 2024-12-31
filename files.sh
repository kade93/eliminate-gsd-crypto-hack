#!/bin/bash

# Related Files
FILES=(
  "/etc/systemd/system/pwnrige.service"
  "/etc/systemd/system/multi-user.target.wants/pwnrige.service"
  "/etc/systemd/system/multi-user.target.wants/pwnrigl.service"
  "/etc/init.d/pwnrig"
  "/etc/cron.d/pwnrig"
  "/etc/cron.daily/pwnrig"
  "/etc/cron.hourly/pwnrig"
  "/etc/cron.weekly/pwnrig"
  "/etc/cron.monthly/pwnrig"
  "/bin/sysdr"
  "/bin/gsd"
)

echo "[INFO] Removing files and directories..."
for FILE in "${FILES[@]}"; do
  if [ -e "$FILE" ]; then
    chattr -i -a "$FILE" 2>/dev/null
    rm -rf "$FILE" 2>/dev/null
    echo "[INFO] File $FILE removed."
  else
    echo "[INFO] File $FILE not found."
  fi
done

# Remove 'gsd' related cron jobs from all users' crontab files
CRONTAB_DIR="/var/spool/cron/crontabs"

echo "[INFO] Removing 'gsd' related cron jobs..."
for CRONTAB in "$CRONTAB_DIR"/*; do
  if [ -f "$CRONTAB" ]; then
    sed -i '/gsd/d' "$CRONTAB" 2>/dev/null
    echo "[INFO] Removed 'gsd' related cron jobs from $CRONTAB."
  else
    echo "[INFO] No crontab file found for $CRONTAB."
  fi
done