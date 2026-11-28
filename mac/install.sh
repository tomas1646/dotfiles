brew install btop \
             fzf \
             gh \
             libpq \
             neovim \
             ripgrep \
             stow \
             vips

# https://karabiner-elements.pqrs.org
# https://herdr.dev/tui/
# https://code.claude.com/docs/en/quickstart#step-1-install-claude-code
# https://vivaldi.com/es/download/

brew install --cask font-jetbrains-mono-nerd-font

sudo ln -s ~/dotfiles/mac/linux_arch_keybinds.json ~/.config/karabiner/assets/complex_modifications/linux_arch_keybinds.json

source ~/dotfiles/mac/stow.sh
