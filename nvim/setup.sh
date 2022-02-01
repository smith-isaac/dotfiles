#!/usr/bin/env bash

# Files to source
files=(init.vim sourcefiles lua)

for f in ${files[@]}; do
    if ! [ -L $HOME/.config/nvim/$f ]; then
	ln -s $PWD/$f $HOME/.config/nvim/
    fi
done

# Linking all vim-latex files
for f in vim-latex/*; do
    if ! [ -L $HOME/.config/nvim/$f ]; then
	ln -s $PWD/$f $HOME/.config/nvim/
    fi
done

# Setting up Julia Language Server
julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer")'
