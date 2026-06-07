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
  fastfetch \
  git \
  less \
  lsof \
  mise \
  nvidia-open \
  satty \
  stow \
  tmux \
  udisks2

sudo systemctl enable cups.service
