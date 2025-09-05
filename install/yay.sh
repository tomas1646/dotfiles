#!/bin/bash

pushd /tmp

git clone https://aur.archlinux.org/yay-bin.git

cd yay-bin

makepkg -si --noconfirm

popd
