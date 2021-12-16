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

source /home/isaacsmith/.config/nvim/neobundle.vim

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

source ~/.config/nvim/languages.vim

" source /home/isaacsmith/.config/nvim/lsp-config.vim

autocmd FileType ruby set shiftwidth=2
