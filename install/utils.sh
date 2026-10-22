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
  github-cli \
  less \
  lsof \
  mise \
  nvidia-open \
  satty \
  stow \
  tmux \
  udisks2 \
  unzip

sudo systemctl enable cups.service
