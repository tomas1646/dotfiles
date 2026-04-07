#!/bin/bash

sudo pacman -S --noconfirm --needed \
  base-devel \
  imagemagick \
  libffi \
  libheif \
  libvips \
  libyaml \
  openssl \
  openssl-1.1 \
  postgresql-libs \
  rust \
  zlib

mise use -g ruby@3.4.1

gem install rails

gem install ruby-lsp
