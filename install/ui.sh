#!/bin/bash

sudo pacman -S --noconfirm \
  mako \
  noto-fonts \
  noto-fonts-emoji \
  ttf-jetbrains-mono-nerd \
  xdg-desktop-portal \
  xdg-desktop-portal-gnome

yay -S --noconfirm \
  waybar \
  gnome-themes-extra

gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
