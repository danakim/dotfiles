#!/bin/bash
# Set me up baby!

# Everything should be relative to our HOME
cd $HOME

# Get an archive of our dotfiles from Github
wget https://github.com/danakim/dotfiles/archive/master.tar.gz && mkdir .dotfiles
tar -xvzf master.tar.gz -C ./.dotfiles --strip-components=1 && rm -f master.tar.gz

# Create our dotfiles symlinks (and remove the original files)
rm -f .bashrc .inputrc .gitconfig .vim .vimrc
ln -s ~/.dotfiles/bashrc_server .bashrc
ln -s ~/.dotfiles/inputrc .inputrc
ln -s ~/.dotfiles/vimrc .vimrc
ln -s ~/.dotfiles/vim .vim
ln -s ~/.dotfiles/gitconfig .gitconfig

# Drop our SSH key in (we probably need the .ssh dir first)
mkdir .ssh && chmod 700 .ssh
ln -s ~/.dotfiles/id_dsa.pub .ssh/id_dsa.pub && chmod 600 .ssh/id_dsa.pub
