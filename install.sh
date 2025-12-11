#!/bin/bash

set -eEu

git submodule update --init --recursive

INSTALL_DIR=$(pwd)/install

source $INSTALL_DIR/utils.sh
source $INSTALL_DIR/yay.sh

rm -rf ~/.bashrc
stow --no-folding .
source ~/.bashrc

source $INSTALL_DIR/apps.sh
source $INSTALL_DIR/docker.sh
source $INSTALL_DIR/hyprland.sh
source $INSTALL_DIR/javascript.sh
source $INSTALL_DIR/nvim.sh
source $INSTALL_DIR/ruby.sh
source $INSTALL_DIR/ui.sh
source $INSTALL_DIR/wifi.sh
# source $INSTALL_DIR/wispro.sh

source ~/.bashrc
stow --no-folding .

sudo pacman -Syu --noconfirm
