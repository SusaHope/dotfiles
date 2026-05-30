#!/usr/bin/env zsh

# Navigation
alias mkcd='function __mkcd() { mkdir "$1"; cd "$1"; unset -f __mkcd; }; __mkcd'
alias o='open .'
alias c='clear'
alias q='exit'
alias v='vi .'

# tmux
alias t='tmux'

# npm
alias ni='npm install'
alias nu='npm uninstall'
alias nid='npm install -D'
alias nr='npm run'
alias niwt="f(){ npm i \$1 && npm i -D @types/\$1; unset -f f }; f"

# docker
alias d='docker'
alias dc='docker compose'
alias dce='docker compose exec'
alias dcl='docker compose logs -f'
alias dp='docker system prune -f && docker rmi -f $(docker images -q)'
