#!/bin/bash

# 악성 IP 목록
BLOCKED_IPS=(
  "212.73.150.237"
  "161.152.194.104"
)

echo "[INFO] Blocking malicious IPs..."
for IP in "${BLOCKED_IPS[@]}"; do
  ufw deny out to "$IP" 2>/dev/null
  iptables -A OUTPUT -d "$IP" -j DROP 2>/dev/null
  echo "[INFO] Blocked IP $IP."
done

# UFW 설정 적용
echo "[INFO] Reloading UFW..."
ufw reload 2>/dev/null

