#!/usr/bin/env bash
# broken-labs/break-routing.sh

set -euo pipefail

# Ensure the script is run with sudo
if [[ $EUID -ne 0 ]]; then
   echo "[-] Error: This script must be run as root (sudo)." 
   exit 1
fi

echo "[+] Simulating Layer 3 Routing Failure..."

# Find current default gateway
DEFAULT_GW=$(ip route show | awk '/default/ {print $3}')
DEFAULT_DEV=$(ip route show | awk '/default/ {print $5}')

if [[ -z "$DEFAULT_GW" ]]; then
    echo "[-] No default gateway found. Is the network already broken?"
    exit 1
fi

# Save state for restoration (so you don't get permanently disconnected)
echo "$DEFAULT_GW $DEFAULT_DEV" > /tmp/saved_gateway.txt
echo "[+] Current gateway ($DEFAULT_GW) saved to /tmp/saved_gateway.txt"

# Delete default route
ip route del default

echo "[==>] LAB ACTIVE: Default gateway removed. WAN connectivity is broken!"
