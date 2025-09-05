#!/bin/bash

sudo pacman -S --noconfirm \
  iwd \
  impala

# IWD deamon (impala)
sudo systemctl start iwd.service
