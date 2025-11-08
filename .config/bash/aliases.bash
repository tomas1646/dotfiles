alias ls='ls -l --color=auto'
alias grep='grep --color=auto'

alias gst='git status'
alias gco='git checkout'
alias gcb='git checkout -b'
alias ggpull='git pull origin $(parse_git_branch)'
alias ggpush='git push origin $(parse_git_branch)'
alias n='nvim .'

## Wispro
alias wcsw="cd ~/wispro/wispro_cloud && yarn install && bundle exec vite dev"
alias wcsr="cd ~/wispro/wispro_cloud && bundle install && LOGS_TO_STDOUT=1 LOG_LEVEL=debug rails s"
alias wcsrl="cd ~/wispro/wispro_cloud && LOGS_TO_STDOUT=1 LOG_LEVEL=debug rails s -b 0.0.0.0 -p 3000"
alias wcss="cd ~/wispro/wispro_cloud && LOGS_TO_STDOUT=1 LOG_LEVEL=debug bundle exec sidekiq"
alias wds='pushd ~/wispro/docker_services && docker compose up -d --remove-orphans rabbit sentry postgres redis influxdb redis_7 && popd'
alias wdstop="pushd ~/wispro/docker_services && docker compose stop && popd"
alias wispod="bash ~/wispro/support/autoPodGenerator/wispro.sh"
alias era="npx expo run:android"
alias erd="npx expo start --dev-client -c"
