#!/bin/bash

sudo pacman -S --noconfirm \
  hyprland \
  hyprpaper

# Screen-sharing
sudo pacman -S --noconfirm \
  pipewire \
  wireplumber \
  xdg-desktop-portal-hyprland

yay -S --noconfirm \
  hyprshot

rm -rf ~/.config/hypr
