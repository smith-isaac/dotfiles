set expandtab
set number
set rnu
set scrolloff=8
set sidescrolloff=8
set softtabstop=4
set shiftwidth=4
set hidden
set spell
set splitright
set splitbelow
set list
set listchars=trail:·,tab:>-
set undofile
set undodir=~/.config/nvim/.undo//
set backup
set backupdir=~/.config/nvim/.backup//
set modeline
set clipboard=unnamedplus
set mouse=a
set termguicolors

" Setting spellcheck colors
hi clear SpellBad
hi SpellBad cterm=underline,standout
hi Pmenu ctermbg=8
hi Pmenu ctermfg=7

let g:airline_theme='deus'
let g:tex_flavor='latex'
let g:tex_fold_enabled=1
" From nvim-cmp.vim
set completeopt=menu,menuone,noselect
