#!/bin/bash

echo "[INFO] Configuring UFW settings..."
# 기본 정책 설정
ufw default deny incoming 2>/dev/null
ufw default allow outgoing 2>/dev/null

# SSH 허용
ufw allow ssh 2>/dev/null
echo "[INFO] SSH port allowed in UFW."

# UFW 활성화
ufw enable 2>/dev/null
echo "[INFO] UFW enabled with SSH allowed."

