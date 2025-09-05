#!/bin/bash

set -eEu

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run with sudo privileges."
   echo "sudo bash install.sh"
   exit 1
fi

grep -q ILoveCandy /etc/pacman.conf || printf "\nILoveCandy\n" >> /etc/pacman.conf

git submodule update --init --recursive

INSTALL_DIR=$(pwd)/install

source $INSTALL_DIR/utils.sh
source $INSTALL_DIR/yay.sh

rm -rf ~/.bashrc
stow .
source ~/.bashrc

source $INSTALL_DIR/apps.sh
source $INSTALL_DIR/docker.sh
source $INSTALL_DIR/hyprland.sh
source $INSTALL_DIR/javascript.sh
source $INSTALL_DIR/nvim.sh
source $INSTALL_DIR/ruby.sh
source $INSTALL_DIR/tmux.sh
source $INSTALL_DIR/ui.sh
source $INSTALL_DIR/wifi.sh
source $INSTALL_DIR/wispro.sh

source ~/.bashrc
stow .

sudo pacman -Syu --noconfirm
