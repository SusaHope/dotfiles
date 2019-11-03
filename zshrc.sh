#!/usr/bin/env zsh

dotfilesDir="$HOME/.dotfiles"
dotfilesDirTk="$dotfilesDir/dotfilesTk"

alias ls='ls -FG'
alias la='ls -lh'
alias ll='ls -Ahl'
alias rmr='rm -rf'
alias grep='grep --color=auto'
alias fgrep='grep --color=auto'
alias egrep='egrep --color=auto'
alias t='tmux'

autoload -U colors compinit promptinit
colors
promptinit
compinit

zstyle ':completion:*' menu select

setopt auto_cd
setopt nonomatch

HISTFILE=$HOME/.history
HISTSIZE=10000
SAVEHIST=20000
setopt hist_ignore_all_dups
setopt inc_append_history

# Use vi as the default editor
export EDITOR=vi

# But still use emacs-style zsh bindings (see https://superuser.com/a/457401)
bindkey -e

alias dotfiles-update='curl -Ls https://raw.githubusercontent.com/SusaHope/dotfiles/master/install.sh | bash -s -- -u'
alias o='open .'
alias git='LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 git'
alias g='git'
alias c='code-insiders .'
alias d='docker'
alias dc='docker-compose'
alias dce='docker-compose exec'
alias dcl='docker-compose logs -f'
alias dp='docker system prune -f && docker rmi -f $(docker images -q)'
alias ccp='xclip -selection clipboard'
alias v='vi .'
alias r='ranger'
alias q='exit'

autoload -Uz vcs_info
setopt prompt_subst

precmd() {
      vcs_info
      if [[ -n ${vcs_info_msg_0_}  ]]; then
          upstream=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2> /dev/null)

          if [[ -z $upstream  ]] then
              upstream_prompt="#";
          else
              upstream_info=$(git rev-list --left-right --count $upstream...HEAD 2> /dev/null)
              case "$upstream_info" in
                  "") # no upstream
                      upstream_prompt="" ;;
                  "0  0") # equal to upstream
                      upstream_prompt="=" ;;
                  "0  "*) # ahead of upstream
                      upstream_prompt=">" ;;
                  *"  0") # behind upstream
                      upstream_prompt="<" ;;
                  *)      # diverged from upstream
                      upstream_prompt="<>" ;;
                  esac
          fi
          # vcs_info found something (the documentation got that backwards
          # STATUS line taken from https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh
          STATUS=$(command git status --porcelain 2> /dev/null | tail -n1)
          if [[ -n $STATUS  ]]; then
              RPROMPT='%{$fg_bold[red]%}${vcs_info_msg_0_} %{$fg_bold[cyan]%}$upstream_prompt%{$reset_color%}'
          else
              RPROMPT='%{$fg_bold[green]%}${vcs_info_msg_0_} %{$fg_bold[cyan]%}$upstream_prompt%{$reset_color%}'
          fi
      else
          # nothing from vcs_info

          # sample for github infos
          # token=$(cat .gh-token)
          # response=$(curl -s "https://api.github.com/search/issues?q=repo:user/repo+type:issue+state:open&access_token=$token" 2>/dev/null)
          # issueCount=$(echo $response | sed -En "s/^.*\"total_count\": ([0-9]+),.*$/\1/p")
          # response=$(curl -s "https://api.github.com/search/issues?q=repo:user/repo+type:pr+state:open&access_token=$token" 2>/dev/null)
          # prCount=$(echo $response | sed -En "s/^.*\"total_count\": ([0-9]+),.*$/\1/p")

          battery=$(source $dotfilesDirTk/battery.sh)
          batteryColor=""
          if [[ $battery -lt 16  ]]
          then
              batteryColor="%{$fg_bold[red]%}"
          fi
          RPROMPT='%T | $batteryColor$battery%%%{$reset_color%}'
          fi
}

NEWLINE=$'\n'
PROMPT="%n@%m:%{$fg[yellow]%}%~%{$reset_color%}${NEWLINE}\$ "
zstyle ':vcs_info:git:*' formats "%b"
zstyle ':vcs_info:git:*' actionformats "%b %{$reset_color%}%{$fg_bold[blue]%}(%a)%{$reset_color%}"
zstyle ':vcs_info:*' enable git

source $dotfilesDirTk/yarn-completion.plugin.zsh
fpath=(~/.zsh/completion $fpath)
