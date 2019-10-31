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

addLinksToFile() {
  src=$1
  target=$2
  echo 'blub'
  echo $src
  echo $target
  info "Adding link to $target..."
  if [ ! -f $target  ]
  then
    touch $target
  fi
  if ! grep -q "$src" "/$target"
  then
    echo "source $src" >> "/$target";
  fi
  success "Done."
}
