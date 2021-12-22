#!/usr/bin/env bash

# Linking init.vim
if ! [ -L $HOME/.config/nvim/init.vim ]; then
    ln -s $PWD/init.vim $HOME/.config/nvim/
fi

# Linking sourcefiles folder
if ! [ -L $HOME/.config/nvim/sourcefiles ]; then
    ln -s $PWD/sourcefiles $HOME/.config/nvim/
fi
