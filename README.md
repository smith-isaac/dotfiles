# dotfiles
Config files for zsh, bash, nvim, etc

If I then create symbolic links to the dot files in this repository then I won't have copies everywhere

i.e.

    ln -s /path/in/repo /path/to/config/file

Made `setup.sh` file that sets up symbolic links. Has to be run from `dotfiles/nvim` directory. Run as follows:

    ./setup.sh

May have to run `chmod +x setup.sh` first

## Requirements
Packages to install that are necessary for the following plugins

Fzf: fzf, ripgrep

Coc: python3-neovim, node
- Ruby: `gem install solargraph`
- C/C++: `sudo apt install clangd`
- Python3-neovim: `python3 -m pip install neovim`

## TODO
- Create script to install Neobundle, fzf, ripgrep, python3-neovim, node, etc
