stow -v --no-folding -t ~/.bin .bin
stow -v --no-folding -t ~/.claude .claude

stow -v --no-folding -d ~/dotfiles/.config -t ~/.config/git git
stow -v --no-folding -d ~/dotfiles/.config -t ~/.config/herdr herdr
stow -v --no-folding -d ~/dotfiles/.config -t ~/.config/nvim nvim

stow -v --no-folding -d ~/dotfiles/mac/.config -t ~/.config/alacritty alacritty
