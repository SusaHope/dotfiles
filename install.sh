#!/bin/bash

dotfilesDir=$HOME/.dotfiles_test
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

rm -rf $dotfilesDir
info "Cloning dotfiles of SusaHope"
git clone --depth=1 https://github.com/SusaHope/dotfiles.git $dotfilesDir > /dev/null 2>&1
info "Cloning dotfiles of tklepzig"
git clone --depth=1 https://github.com/tklepzig/dotfiles.git $dotfilesDirTk > /dev/null 2>&1
success "Done."

addLinkToFile "zshrc.sh" ".zshrc" $dotfilesDir
addLinkToFile "vim/vimrc" ".vimrc" $dotfilesDir
addLinkToFile "tmux.conf" ".tmux.conf" $dotfilesDir
addLinkToFile "zshrc.sh" ".zshrc" $dotfilesDirTk
addLinkToFile "vim/vimrc" ".vimrc" $dotfilesDirTk
addLinkToFile "tmux.conf" ".tmux.conf" $dotfilesDirTk
