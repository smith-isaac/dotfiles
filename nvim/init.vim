set expandtab
set number
set rnu
set scrolloff=8
set sidescrolloff=8
set shiftwidth=4
set hidden
set spell
set splitright
set list
set listchars=trail:·
set undofile
set undodir=~/.config/nvim/.undo//
set backup
set backupdir=~/.config/nvim/.backup//


let g:airline_theme='deus'
let g:tex_flavor='latex'
" From nvim-cmp.vim
set completeopt=menu,menuone,noselect

source ~/.config/nvim/sourcefiles/dein.vim
source ~/.config/nvim/sourcefiles/mappings.vim
source ~/.config/nvim/sourcefiles/languages.vim
lua require("nvim-cmp")
lua require("lsp")
source ~/.config/nvim/sourcefiles/nerdcommenter.vim
source ~/.config/nvim/sourcefiles/dashboard.vim
source ~/.config/nvim/sourcefiles/fzf.vim

filetype plugin indent on
syntax enable
