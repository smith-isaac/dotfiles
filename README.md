# dotfiles
Config files for zsh, bash, nvim, etc

If I then create symbolic links to the dot files in this repository then I
won't have copies everywhere

i.e.

    ln -s /path/in/repo /path/to/config/file

Made `setup.sh` file that sets up symbolic links. Has to be run from
`dotfiles/nvim` directory. Run as follows:

    ./setup.sh

May have to run `chmod +x setup.sh` first

Made `install-deps.sh` to install dependencies. Run as follows:

    chmod +x install-deps.sh && sudo ./install-deps.sh

## Requirements Packages to install that are necessary for the following
plugins

Fzf: fzf, ripgrep, universal-ctags, silversearcher-ag, fd-find

    sudo apt install fzf ripgrep universal-ctags silversearcher-ag fd-find

Coc: python3-neovim, node
- Ruby: `gem install solargraph`
- C/C++: `sudo apt install clangd`
- Python3-neovim: `python3 -m pip install neovim`

Lsp-config:
- Ruby: `gem install solargraph`
- C/C++: `sudo apt install clangd bear`
- Python: (pyright through npm) `sudo apt install npm && sudo npm install -g
  pyright`

## TODO
- Maybe use `dein.vim` instead of NeoBundle
    - Maybe set bundle install directory to be `~/.config/nvim/bundle/` instead
      of `~/.vim/bundle/`
    - All in a new branch though after I merge this one
- For $\LaTeX$ use [TeXLab](https://github.com/latex-lsp/texlab)
    - Make sure to download prebuilt binary or automate building from source
    - Setup links so that I can keep `vim-latex` in repo and have it still work
