#!/bin/bash

sudo pacman -S --noconfirm \
  hypridle \
  hyprland \
  hyprlock \
  hyprpaper \
  hyprpicker

# Screen-sharing
sudo pacman -S --noconfirm \
  pipewire \
  wireplumber \
  xdg-desktop-portal-hyprland

yay -S --noconfirm \
  hyprshot
