#!/bin/bash

sudo pacman -S --noconfirm \
  alacritty \
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
  udisks2

sudo systemctl enable cups.service
