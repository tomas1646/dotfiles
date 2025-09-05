# Paquetes

```bash
git submodule init
git submodule update --recursive

sudo pacman -S --noconfirm \
  git \
  hyprland \
  alacritty \
  nvim \
  stow
```

# Packages
```bash
sudo pacman -S --noconfirm \
  curl \
  blueberry \
  rofi \
  vivaldi \
  discord \
  tmux \
  xclip \
  ttf-jetbrains-mono-nerd \
  nautilus \
  docker \
  docker-compose \
  fzf \
  less \
  pavucontrol \
  hyprpaper \
  htop \
  mako \
  iwd \
  impala \
  postgresql-libs \
  libvips \
  imagemagick \
  noto-fonts \
  noto-fonts-emoji \
  bash-completion \
  lua-language-server \
  lsof \
  wiremix \
  libreoffice \
  btop \
  udisks2

# IWD deamon (impala)
sudo systemctl start iwd.service

# Screen-sharing
sudo pacman -S --noconfirm \
  wireplumber \
  xdg-desktop-portal-hyprland

# Nvim
sudo pacman -S --noconfirm \
  ripgrep

gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

yay -S --noconfirm \
  waybar \
  postman-bin \
  gnome-themes-extra \
  hyprshot \
  spotify
       

stow .

# Install tmux plugins

~/.tmux/plugins/tpm/bin/install_plugins
```

## YAY
```bash
pushd /tmp
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
popd
```


## NVM
```bash
PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash'

npm install --global yarn

# Typescript lsp
npm install -g typescript typescript-language-server

# Eslint
npm install -g vscode-langservers-extracted

# Docker
npm install -g dockerfile-language-server-nodejs

# Prettier
npm install -g prettier
```

## Ruby + RBENV
```bash
## Ruby requirements
sudo pacman -S --noconfirm --needed \
  base-devel \
  rust \
  libffi \
  libyaml \
  openssl \
  zlib

# Install Rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

# gem install ruby-lsp


# Ruby-build plugin
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
```

# Wispro
```bash
sudo pacman -S element-desktop

## Esto demora mucho
yay -S gcc12

CC=gcc-12 rbenv install 2.7.6

## Kubectl
pushd /tmp
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.33.3/2025-08-03/bin/linux/amd64/kubectl
chmod +x ./kubectl
cp ./kubectl $HOME/.bin/kubectl

curl -Lo aws-iam-authenticator https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.6.11/aws-iam-authenticator_0.6.11_linux_amd64
chmod +x ./aws-iam-authenticator

## AWS cli
sudo pacman -S unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

popd
```

## Docker post-install
```bash
sudo systemctl enable docker.service
sudo systemctl deamon-reload

sudo usermod -aG docker $USER
```
