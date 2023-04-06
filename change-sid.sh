#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be root to run this script, please use: sudo ./$0" 2>&1
  exit 1
fi

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
echo "deb http://deb.debian.org/debian/ sid main non-free contrib" > /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian/ sid main non-free contrib" >> /etc/apt/sources.list

# Update packages list and update system
apt update
apt upgrade -y
