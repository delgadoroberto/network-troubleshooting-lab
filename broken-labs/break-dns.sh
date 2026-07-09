#!/usr/bin/env bash
# broken-labs/break-dns.sh

set -euo pipefail

# Ensure the script is run with sudo
if [[ $EUID -ne 0 ]]; then
   echo "[-] Error: This script must be run as root (sudo)." 
   exit 1
fi

echo "[+] Simulating DNS Failure..."

# Backup current configuration if not already backed up
if [[ ! -f /etc/resolv.conf.bak ]]; then
    cp /etc/resolv.conf /etc/resolv.conf.bak
    echo "[+] Backup created at /etc/resolv.conf.bak"
fi

# Overwrite with a non-existent local DNS server loopback
echo "nameserver 127.0.55.55" > /etc/resolv.conf

echo "[==>] LAB ACTIVE: DNS resolution is now broken. Try to diagnose it!"
