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
  fzf

# Screen-sharing
sudo pacman -S --noconfirm \
  wireplumber \
  xdg-desktop-portal-hyprland

# Nvim
sudo pacman -S --noconfirm \
  ripgrep

stow .
```

# Wispro
```bash
sudo pacman -S element-desktop
```

## NVM
```bash
PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash'

npm install --global yarn
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

# Ruby-build plugin
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
```

## Docker post-install
```bash
sudo systemctl enable docker.service

sudo systemctl enable docker.service
sudo systemctl deamon-reload

sudo usermod -aG docker $USER
```


## NOTES:
* Install tmux plugins: enter Tmux ``Super + I``
