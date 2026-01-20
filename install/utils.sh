#!/bin/bash

sudo pacman -S --noconfirm \
  alacritty \
  bash-completion \
  brightnessctl \
  curl \
  cups \
  cups-pdf \
  dmidecode \
  git \
  less \
  lsof \
  mise \
  satty \
  stow \
  tmux \
  udisks2

sudo systemctl enable cups.service
