#!/bin/bash

# Check Root Privledges
if [[ $EUID -ne 0 ]]; then
  echo -e "$0 requires root privledges"
  echo -e "use su - to switch to root account"
  exit 1
fi

# Install Requirements
if command -v zsh &> /dev/null && command -v git &> /dev/null && command -v wget &> /dev/null; then
    echo -e "ZSH and Git are already installed\n"
else
    if apt install -y zsh git wget ; then
        echo -e "zsh wget and git Installed\n"
    else
        echo -e "Please install the following packages first, then try again: zsh git wget \n" && exit
    fi
fi

# Make dir for plugins and themes
mkdir -p /usr/share/zsh/plugins /usr/share/zsh/themes
