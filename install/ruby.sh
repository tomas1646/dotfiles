#!/bin/bash

sudo pacman -S --noconfirm --needed \
  base-devel \
  imagemagick \
  libffi \
  libvips \
  libyaml \
  openssl \
  postgresql-libs \
  rust \
  zlib \

# Install Rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

# Ruby-build plugin
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
