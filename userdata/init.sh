#!/bin/bash
###############################################################
# Ubuntu 24.04 Bootstrap Script
# Runs on first boot via EC2 user_data
###############################################################

set -euo pipefail
exec > >(tee /var/log/bootstrap.log | logger -t bootstrap) 2>&1
echo "=== Bootstrap started at $(date) ==="

# --- System update ---
apt update -y
apt upgrade -y
apt install apache2 -y

echo "System updated and essential packages installed"

# --- Set hostname ---
#hostnamectl set-hostname lab-host
#echo "Hostname set to lab-host"

# --- Timezone configuration ---
timedatectl set-timezone America/New_York
echo "Timezone set to America/New_York"

echo "Bootstrap completed: $(date)" >> /var/log/bootstrap-complete.log