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

## Requirements Packages to install that are necessary for the following plugins

Dein:
Need to make an install directory for `dein.vim` to work. I configured `install_deps.sh` to install `node` so that `markdown-preview.nvim` will work.
Run `dein_installer.sh` using new directory.

    mkdir ~/.config/nvim/dein
    ./dein_installer.sh ~/.config/nvim/dein

Fzf: fzf, ripgrep, universal-ctags, silversearcher-ag, fd-find

    sudo apt install fzf ripgrep universal-ctags silversearcher-ag fd-find

Lsp-config:
- Ruby: `gem install solargraph`
- C/C++: `sudo apt install clangd bear`
- Python: (pyright through npm) `sudo apt install npm && sudo npm install -g
  pyright`

## TODO
- Maybe use `dein.vim` instead of NeoBundle
    - Maybe set bundle install directory to be `~/.config/nvim/bundle/` instead
      of `~/.vim/bundle/`
    - Need to make a folder `~/.config/nvim/dein` and use the `dein_install.sh` there
    - All in a new branch though after I merge this one
    - Specific instructions for [fzf.vim](https://github.com/Shougo/dein.vim/issues/74)
    - Specific instructions for [Markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
        - Maybe change `cd app && yarn install` to `cd app && sh ./install.sh`
	- Requires node: can get from installing [nvm](https://docs.microsoft.com/en-us/windows/dev-environment/javascript/nodejs-on-wsl) first
- For $\LaTeX$ use [TeXLab](https://github.com/latex-lsp/texlab)
    - Make sure to download prebuilt binary or automate building from source
    - Setup links so that I can keep `vim-latex` in repo and have it still work
