#!/bin/bash

sudo pacman -S --noconfirm \
  mako \
  noto-fonts \
  noto-fonts-emoji \
  ttf-jetbrains-mono-nerd

yay -S --noconfirm \
  waybar \
  gnome-themes-extra

gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
