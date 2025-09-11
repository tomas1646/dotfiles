#!/bin/bash

sudo pacman -S --noconfirm \
  element-desktop \
  unzip

yay -S --noconfirm \
  ngrok \
  android-studio

# NOTE: Esto tarda mucho tiempo
# yay -S gcc12
#
# CC=gcc-12 rbenv install 2.7.6

pushd /tmp

## Kubectl
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.33.3/2025-08-03/bin/linux/amd64/kubectl
chmod +x ./kubectl
cp ./kubectl $HOME/.bin/kubectl

## aws-iam-authenticator
curl -Lo aws-iam-authenticator https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.6.11/aws-iam-authenticator_0.6.11_linux_amd64
chmod +x ./aws-iam-authenticator

## AWS cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

popd

# Android-Studio
mise use -g java@openjdk-21
mise use -g java@21

# .ruby-version
mise settings add idiomatic_version_file_enable_tools ruby
