#!/bin/bash

sudo pacman -S --noconfirm \
  tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install tmux plugins
~/.tmux/plugins/tpm/bin/install_plugins
