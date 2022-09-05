source ~/.config/nvim/sourcefiles/settings.vim
source ~/.config/nvim/sourcefiles/dein.vim
source ~/.config/nvim/sourcefiles/mappings.vim
source ~/.config/nvim/sourcefiles/languages.vim
source ~/.config/nvim/sourcefiles/nerdcommenter.vim
source ~/.config/nvim/sourcefiles/fzf.vim

lua require("nvim-cmp")
lua require("lsp")
lua require("plugins.dashboard")
lua require("catppuccin")
lua require("tree-sitter")

let g:catppuccin_flavour = "macchiato"
colorscheme catppuccin

filetype plugin indent on
syntax enable
