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

eval "$(~/.rbenv/bin/rbenv init - bash)"

# Ruby-build plugin
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

rbenv install 3.4.1
rbenv local 3.4.1

gem install rails
