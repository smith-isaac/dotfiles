set number
set rnu
set scrolloff=8
set sidescrolloff=8
set shiftwidth=4
filetype on

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'preservim/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
NeoBundle 'junegunn/fzf'
NeoBundle 'junegunn/fzf.vim'
NeoBundle 'voldikss/vim-floaterm'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

let g:airline_theme='deus'

nnoremap <SPACE> <Nop>
let mapleader=" "

noremap <leader>t :NERDTreeToggle<CR>
noremap <leader>ft :set filetype?<CR>

" Some cool maps
nmap <leader>ve :edit ~/.config/nvim/init.vim<CR>
nmap <leader>vr :source ~/.config/nvim/init.vim<CR>

nmap <leader>k :nohlsearch<CR>

nmap <leader><TAB> :tabe<cr>

map gf :edit <cfile><cr>

vnoremap < <gv
vnoremap > >gv

nmap <leader>g :Git<cr>
nmap <leader>p :Git push<cr>

" FZF mappings

nmap <leader>o :Files<cr>

let g:fzf_ags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" Custom filetype mappings
autocmd FileType c,cpp noremap <leader>m :!make<cr>
autocmd FileType c,cpp noremap <leader>c :!make clean<cr>
"autocmd FileType ruby noremap <buffer> <leader>r :!ruby {"%:r" . "_test." . "%:e"}<cr>
autocmd FileType ruby nmap <buffer> <leader>r :exec "!ruby " . expand("%:r") . "_test." . expand("%:e")<cr>

