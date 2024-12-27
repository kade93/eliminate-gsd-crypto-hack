#!/bin/bash

echo "[INFO] Configuring UFW settings..."
# Default setup (optional)
ufw default deny incoming 2>/dev/null
ufw default allow outgoing 2>/dev/null

ufw allow ssh 2>/dev/null
echo "[INFO] SSH port allowed in UFW."

ufw enable 2>/dev/null
echo "[INFO] UFW enabled with SSH allowed."

