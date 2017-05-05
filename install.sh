#!/bin/bash

#Run script to link all configuration files into place

FILES=".vimrc .vim/colors/jellybeans.vim .zshrc .oh-my-zsh/custom/conf.zsh .oh-my-zsh/custom/alias.zsh .tmux.conf"

DIRS=".vim/colors .oh-my-zsh/custom"

echo "Initializing backup directory..."
mkdir old-dotfiles
for dir in $DIRS; do
    mkdir -p old-dotfiles/$dir
done


echo "Moving old configurations to ./old-conf and linking the new file and linking the new filess"

for file in $FILES; do
    mv ~/$file ./old-dotfiles/
    ln $file ~/$file
done
