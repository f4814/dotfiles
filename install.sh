#!/bin/bash

#Run script to link all configuration files into place

FILES=".vimrc .vim/colors/jellybeans.vim .zshrc .oh-my-zsh/custom/conf.zsh .oh-my-zsh/custom/alias.zsh .tmux.conf"

DIRS=".vim/colors .oh-my-zsh/custom"

ROOT=$(pwd)

echo "Installing oh-my-zsh\n-------------------------------------------------------------------------------------------------------------------------------"
git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh

echo "Installing Nerdfonts\n--------------------------------------------------------------------------------------------------------------"
git clone https://github.com/ryanoasis/nerd-fonts.git /tmp/nerdfonts
cd /tmp/nerdfonts
/tmp/nerdfonts/install.sh
cd $ROOT

echo "Initializing (backup) directory...\n---------------------------------------------------------------------------------------------------"
mkdir old-dotfiles
for dir in $DIRS; do
    mkdir -p old-dotfiles/$dir
    mkdir -p ~/$dir
done

echo "Moving old configurations to ./old-conf and linking the new file\---------------------------------------------------------------------------------------"
for file in $FILES; do
    mv -f ~/$file ./old-dotfiles/
    ln $file ~/$file
done

echo "Prepairing Vim plugin setup\n--------------------------------------------------------------------------------------------------------------------------------"
if [ -f /etc/arch-release ]
then
    pacman -S ctags
fi
pip3 install powerline-status
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c ":PlugInstall" -c ":q"
