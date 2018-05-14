#!/bin/bash
###
# Set me up baby!
###

# Check if we have git installed
which git > /dev/null
if [[ ! $? = 0 ]]; then
    printf "\u274c You first need to install git before running this script.\n"
    exit 2
fi

# Everything should be relative to our HOME
cd $HOME

# Cleanup any old copy of the repo
rm -rf .dotfiles && printf "Cleaned up old dotfiles ✔\n"

# From now fail on any error and capture it
set -e
err_report() {
    printf "\u274c  Error on line $1\n"
}
trap 'err_report $LINENO' ERR

# Get a copy of the dotfiles git repo from Github
git clone --quiet https://github.com/danakim/dotfiles.git .dotfiles
printf "Cloned the dotfiles repo ✔\n"

# Create our dotfiles symlinks (and remove the original files)
rm -rf .bashrc .inputrc .gitconfig .vim .vimrc && printf "Cleaned up old symlinks ✔\n"
ln -s ~/.dotfiles/bashrc_server .bashrc
ln -s ~/.dotfiles/inputrc .inputrc
ln -s ~/.dotfiles/vimrc .vimrc
ln -s ~/.dotfiles/vim .vim
ln -s ~/.dotfiles/gitconfig .gitconfig
printf "Installed new dotfiles ✔\n"

# Drop our SSH key in (we probably need the .ssh dir first)
if [ ! -d ~/.ssh ] ; then
    mkdir ~/.ssh && chmod 700 ~/.ssh && printf "Created .ssh dir ✔\n"
fi
if [ ! -f ~/.ssh/id_rsa.pub ]; then
    ln -s ~/.dotfiles/id_rsa.pub ~/.ssh/id_rsa.pub && chmod 600 ~/.ssh/id_rsa.pub && printf "Installed our public SSH key ✔\n"
fi
