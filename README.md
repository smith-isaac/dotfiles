# dotfiles
Config files for zsh, bash, nvim, etc

#### This is my branch for redoing the config files for CMP and Lsp-config

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

Julia:
- Run the following in order to get the `julials` language server running correctly

    julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer")'

## TODO
- [ ] Use [DotBot](https://github.com/anishathalye/dotbot) to automate creating symlinks for my dotfiles
