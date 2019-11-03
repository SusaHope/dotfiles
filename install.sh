#!/bin/bash

dotfilesDir=$HOME/.dotfiles
dotfilesDirTk=$dotfilesDir/dotfilesTk

rm -rf $dotfilesDir
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

info "Cloning dotfiles of SusaHope"
git clone --depth=1 https://github.com/SusaHope/dotfiles.git $dotfilesDir > /dev/null 2>&1
info "Cloning dotfiles of tklepzig"
git clone --depth=1 https://github.com/tklepzig/dotfiles.git $dotfilesDirTk > /dev/null 2>&1
success "Done."

#addLinksToTopOfFile "$dotfilesDirTk/zshrc.sh" "$dotfilesDir/zshrc"
#addLinksToTopOfFile "$dotfilesDirTk/vim/vimrc" "$dotfilesDir/vim/vimrc"
addLinksToTopOfFile "$dotfilesDirTk/tmux.conf" "$dotfilesDir/tmux.conf"

addLinksToTopOfFile "$dotfilesDir/zshrc.sh" "$HOME/.zshrc"
addLinksToTopOfFile "$dotfilesDir/vim/vimrc" "$HOME/.vimrc"
addLinksToTopOfFile "$dotfilesDir/tmux.conf" "$HOME/.tmux.conf"
