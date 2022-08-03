# dotfiles
Config files for zsh, bash, nvim, etc

#### This is my branch for redoing the config files for CMP and Lsp-config

## Packages to install manually
- Ruby (`ruby`, `ruby-dev`, `solargraph`)
- C/C++ (`gcc`, `clangd`, `bear`)
- Python (`python3`, `pyright`)
- Julia (`julia`, Julials)
- LaTeX (`texlive`, TexLab)
- [Neovim](https://neovim.io/) (`fzf`, `ripgrep`, `universal-ctags`, `silversearcher-ag`, `fd-find`)
- [Node](https://nodejs.org/en/)

### Deps for Neovim's Language Server Protocol
---
I.e.all dependencies or apps I need to install as part of this config
- Neovim and plugins
    - `fzf`
    - `ripgrep`
    - `universal-ctags`
    - `silversearcher-ag`
    - `fd-find`
    - Markdown previewer
- Language Servers
    - [Solargraph](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#solargraph) (Ruby)
        - `gem install solargraph` after `sudo apt install ruby ruby-dev`
    - [Clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd) (C/C++)
        - `sudo apt install clangd bear`
        - Need `bear` in order for language server to pick up on other dependant files
    - [Julials](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#julials)
        - Get julia from [Julia Website](julialang.com)
        - After extracting, create symlink to $PATH so that julia can be run from anywhere (i.e. `/usr/local/bin`)
        - `julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer")'`
    - [TexLab](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#texlab)
        - Use [precompiled binaries](https://github.com/latex-lsp/texlab/releases)
    - [Vimls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vimls)
        - Can install vim-language-server via npm
        - `npm install -g vim-language-server`
    - [Bashls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls)
        - `bash-language-server` can be installed via `npm`
        - `npm i -g bash-language-server`
    - [sumneko_lua](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua)
        - Can download [precompiled binaries](https://github.com/sumneko/lua-language-server/releases) of lua-language-server
    - [Pyright](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright)
        - Can install with `npm`
        - `npm install -g pyright`

## TODO
- [ ] Use install script to place all precompiled binaries (like for Lua and TexLab) into a separate folder and use those instead
    - Then add the path to that folder in the `bash/bashrc`
