# Install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Make backup dir
mkdir ~/.vim/backup

# install plugins
vim -c ":PlugInstall"
