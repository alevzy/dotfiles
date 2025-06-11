#!/bin/bash

# make symlinks
ln -sf $PWD/.vimrc $HOME/.vimrc
ln -sf $PWD/.zshrc $HOME/.zshrc

# get vim plugins
VIMPACK=$HOME/.vim/pack
GITHUB=git@github.com
PLUGIN_LIST=(
    "$GITHUB:morhetz/gruvbox.git" "$VIMPACK/default/start/gruvbox" "$VIMPACK/default/start/gruvbox/doc"
    "$GITHUB:vim-airline/vim-airline.git" "$VIMPACK/dist/start/vim-airline" "$VIMPACK/dist/start/vim-airline/doc"
    "$GITHUB:vim-airline/vim-airline-themes.git" "$VIMPACK/dist/start/vim-airline-themes" "$VIMPACK/dist/start/vim-airline-themes/doc"
    "$GITHUB:tpope/vim-fugitive.git" "$VIMPACK/tpope/start/fugitive" "fugitive/doc"
    "$GITHUB:preservim/nerdtree.git" "$VIMPACK/vendor/start/nerdtree" "$VIMPACK/vendor/start/nerdtree/doc"
    "$GITHUB:yegappan/lsp.git" "$VIMPACK/downloads/opt/lsp" "$VIMPACK/downloads/opt/lsp/doc"
)
COUNT=${#PLUGIN_LIST[@]}
for (( i=0; i<COUNT; i+=3))
do
    SRC=${PLUGIN_LIST[i+0]}
    DST=${PLUGIN_LIST[i+1]}
    HLP=${PLUGIN_LIST[i+2]}
    if [[ ! -d "$DST" ]]; then
        echo "Installing plugin from $SRC"
        git clone --depth=1 $SRC $DST
        vim -u NONE -c "helptags $HLP" -c q
    else
        echo "Plugin $SRC is already installed"
    fi
done

