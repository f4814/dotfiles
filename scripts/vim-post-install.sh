# Install vim plug
git clone https://github.com/k-takata/minpac.git \
    ~/.vim/pack/minpac/opt/minpac

# Make backup dir
mkdir ~/.vim/backup

# install plugins
vim -c ":PackUpdate"
