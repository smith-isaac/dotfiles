#!/usr/bin/env bash

# Common packages I like to use
sudo apt install fzf ripgrep fd-find curl wget

# Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
source $HOME/.nvm/nvm.sh
nvm install --lts

# Julia
curl -fsSL https://install.julialang.org | sh
