set number
set rnu
set scrolloff=8
set sidescrolloff=8
set shiftwidth=4
"set list
"set listchars=trail:-
filetype on

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" NeoBundle Source File
source $HOME/.config/nvim/neobundle.vim

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
nmap <leader>ve :edit ~/.config/nvim/init.vim<CR>
nmap <leader>vr :source ~/.config/nvim/init.vim<CR>
nmap <leader>k :nohlsearch<CR>
nmap <leader><TAB> :tabe<cr>
map gf :edit <cfile><cr>
vnoremap < <gv
vnoremap > >gv
nmap <leader>g :Git<cr>
nmap <leader>p :Git push<cr>
nmap <leader>o :Files<cr>
nmap <leader>d :pwd<cr>

let g:fzf_ags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

source ~/.config/nvim/languages.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/lsp-config.vim
source ~/.config/nvim/nerdcommenter.vim

" Not using nvim-cmp right now so I am disabling the nvim-cmp config file
" source /home/isaacsmith/.config/nvim/nvim-cmp.vim

let g:coc_global_extensions = ['coc-clangd', 'coc-solargraph', 'coc-pyright']

autocmd FileType ruby set shiftwidth=2
