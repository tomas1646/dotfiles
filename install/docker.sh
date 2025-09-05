#!/bin/bash

sudo pacman -S --noconfirm \
  docker \
  docker-compose

sudo systemctl enable docker.service
sudo systemctl daemon-reload

sudo usermod -aG docker $USER
