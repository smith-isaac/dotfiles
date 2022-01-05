set number
set rnu
set scrolloff=8
set sidescrolloff=8
set shiftwidth=4
set hidden
set spell
set splitright
let g:airline_theme='deus'
" From nvim-cmp.vim
set completeopt=menu,menuone,noselect

source ~/.config/nvim/sourcefiles/dein.vim
source ~/.config/nvim/sourcefiles/mappings.vim
source ~/.config/nvim/sourcefiles/languages.vim
" source ~/.config/nvim/sourcefiles/nvim-cmp.vim
lua require("nvim-cmp")
lua require("lsp")
source ~/.config/nvim/sourcefiles/nerdcommenter.vim
source ~/.config/nvim/sourcefiles/dashboard.vim
source ~/.config/nvim/sourcefiles/fzf.vim

filetype plugin indent on
syntax enable
