#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -l --color=auto'
alias grep='grep --color=auto'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="\u \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

alias gst='git status'
alias gco='git checkout'
alias gcb='git checkout -b'
alias ggpull='git pull origin $parse_git_branch'
alias ggpush='git push origin $parse_git_branch'

# Custom scripts
export PATH="$HOME/.bin:$PATH"

# Tmux-sessionizer
bind -x '"\C-f":"tmux-sessionizer"'

## NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## RBENV
eval "$(~/.rbenv/bin/rbenv init - bash)"

## AUTOENV
source ~/.autoenv/activate.sh
