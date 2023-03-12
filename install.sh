#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be root to run this script, please use: sudo ./install.sh" 2>&1
  exit 1
fi

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp sources.list /etc/apt/sources.list

# Update packages list and update system
apt update
apt upgrade -y

# Install defaults
apt install nala mc zsh
