set number
set rnu
set scrolloff=8
set sidescrolloff=8
set shiftwidth=4

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
nmap <leader>ve :tabedit ~/.config/nvim/init.vim<CR>
nmap <leader>vr :source ~/.config/nvim/init.vim<CR>

nmap <leader>k :nohlsearch<CR>

map gf :edit <cfile><cr>

vnoremap < <gv
vnoremap > >gv
