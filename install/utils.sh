#!/bin/bash

sudo pacman -S --noconfirm \
  alacritty \
  base-devel \
  bash-completion \
  brightnessctl \
  cups \
  cups-pdf \
  curl \
  dmidecode \
  git \
  less \
  lsof \
  mise \
  satty \
  stow \
  tmux \
  udisks2 \
  fastfetch

sudo systemctl enable cups.service
