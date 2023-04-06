#!/bin/bash

# Check Root Privledges
if [[ $EUID -ne 0 ]]; then
  echo -e "$0 requires root privledges"
  echo -e "use su - to switch to root account"
  exit 1
fi


# Install sudo
apt install sudo -y

# Link usermod to /usr/bin
ln /usr/sbin/usermod /usr/bin

#add user to sudo grp
read -p "Enter user to add to sudo grp.\n" user
usermod -aG sudo $user
user $user is added to sudo grp.

id $user

exit 0
