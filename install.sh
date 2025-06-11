#!/bin/bash

# make symlinks
ln -sf $PWD/.vimrc $HOME/.vimrc
ln -sf $PWD/.zshrc $HOME/.zshrc

# get vim plugins
VIMPACK=$HOME/.vim/pack
PLUGINDIR=$VIMPACK/default/start/gruvbox
echo "Cloning gruvbox to $PLUGINDIR"
git clone --depth=1 git@github.com:morhetz/gruvbox.git $PLUGINDIR
