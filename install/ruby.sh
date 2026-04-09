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

mise settings ruby.compile=false
mise use -g ruby@3.4.1

source ~/.bashrc

gem install rails

gem install ruby-lsp
