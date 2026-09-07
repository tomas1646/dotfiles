#!/bin/bash

sudo pacman -S --noconfirm \
  gnome-themes-extra \
  mako \
  noto-fonts \
  noto-fonts-emoji \
  quickshell \
  ttf-jetbrains-mono-nerd \
  waybar \
  xdg-desktop-portal \
  xdg-desktop-portal-gnome \

gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
