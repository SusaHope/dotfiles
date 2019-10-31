isProgramInstalled()
{
      command -v $1 >/dev/null 2>&1 || { return 1 >&2;  }
          return 0
}

info()
{
      echo -e "${accent}$1${reset}"
}

success()
{
      echo -e "${success}$1${reset}"
}

error()
{
      echo -e "${error}$1${reset}"
}

addLinkToFile() {
  src=$1
  target=$2
  dotfiles=$3
  info "Adding link to $target..."
  if [ ! -f $HOME/$target  ]
  then
    touch $HOME/$target
  fi
  if ! grep -q "$dotfiles/$src" $HOME/$target
  then
    echo "source $dotfiles/$src" >> $HOME/$target;
  fi
  success "Done."
}

removeLinkFromFile() {
  target=$1
  info "Remove link from $target..."
  if [ -f $HOME/$target  ]
  then
    sed /.dotfiles/d $HOME/$target > $HOME/$target.tmp && mv $HOME/$target.tmp $HOME/$target
  fi
  success "Done."
}
