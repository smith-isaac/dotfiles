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

Lsp-config:
- Ruby: `gem install solargraph`
- C/C++: `sudo apt install clangd bear`


## TODO
- Get all needed dependancies before creating `install-deps.sh`
    - Create script to install Neobundle, fzf, ripgrep, python3-neovim, node, etc
- Change NeoBundle install path to `~/.config/nvim/bundle/`
- Maybe use `dein.vim` instead of NeoBundle
- Try using `lsp-config` instead of `coc.vim`
    - I can use `sonargraph` and `clangd` in `lsp-config`
    - Make new branch for this change to not screw everything up
- Use `bear` to generate `compile_commands.json` for C/C++_ projects
