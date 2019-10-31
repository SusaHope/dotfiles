#!/bin/bash

dotfilesDir=$HOME/.dotfiles
dotfilesDirTk=$dotfilesDir/dotfilesTk

if [ ! -f $dotfilesDir/common.sh  ]
then
   source <(curl -Ls https://raw.githubusercontent.com/SusaHope/dotfiles/master/common.sh)
else
   source $dotfilesDir/common.sh
fi

info "Searching for Git..."
if ! isProgramInstalled git
then
    error "No Git found!"
    exit
fi
success "Git found: $(which git)."

info "Cloning Repo..."
rm -rf $dotfilesDir
git clone --depth=1 https://github.com/SusaHope/dotfiles.git $dotfilesDir > /dev/null 2>&1
success "Done."
