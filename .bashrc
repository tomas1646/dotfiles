#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
export ANDROID_HOME=$HOME/Android/Sdk
export EDGE_PATH=/usr/bin/vivaldi

alias ls='ls -l --color=auto'
alias grep='grep --color=auto'

parse_git_branch() {
    git symbolic-ref --short HEAD 2> /dev/null
}

print_git_changes_to_commit() {
    git rev-parse --is-inside-work-tree &>/dev/null || return

    if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
        echo " "
    else
        echo "✔ "
    fi
}

ARROW=$'\uf0a9 '
BOLD="\e[1m"
BLUE="\[$(tput setaf 12)\]"
ORANGE="\[$(tput setaf 3)\]"
RESET_COLOR="\[$(tput sgr0)\]"
PS1="${BOLD}${BLUE}\w${RESET_COLOR} ${BOLD}${ORANGE}\$(parse_git_branch) \$(print_git_changes_to_commit)$ARROW ${RESET_COLOR}"

alias gst='git status'
alias gco='git checkout'
alias gcb='git checkout -b'
alias ggpull='git pull origin $(parse_git_branch)'
alias ggpush='git push origin $(parse_git_branch)'

## Wispro
alias wcsw="cd ~/wispro/wispro_cloud
yarn install
bundle exec vite dev"
alias wcsr="cd ~/wispro/wispro_cloud
bundle install
LOGS_TO_STDOUT=1 LOG_LEVEL=debug rails s"
alias wcsrl="cd ~/wispro/wispro_cloud
LOGS_TO_STDOUT=1 LOG_LEVEL=debug rails s -b 0.0.0.0 -p 3000"
alias wcss="cd ~/wispro/wispro_cloud
LOGS_TO_STDOUT=1 LOG_LEVEL=debug bundle exec sidekiq"
alias wds='pushd ~/wispro/docker_services
docker compose up -d --remove-orphans rabbit sentry postgres redis influxdb redis_7
popd'
alias wdstop="pushd ~/wispro/docker_services
docker compose stop
popd"
alias wispod="bash ~/wispro/support/autoPodGenerator/wispro.sh"
alias era="npx expo run:android"

# Opciones de Readline
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind 'set show-all-if-unmodified on'
# Do not autocomplete hidden files unless the pattern explicitly begins with a dot
bind 'set match-hidden-files off'
# If there are more than 200 possible completions for a word, ask to show them all
bind 'set completion-query-items 200'
# Coloring for Bash 4 tab completions.
bind 'set colored-stats on'

# Keybindings
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

# Custom scripts
export PATH="$HOME/.bin:$PATH"

# Bash autocomplete
# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

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

## Mise
eval "$(mise activate bash)"

