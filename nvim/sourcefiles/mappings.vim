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
" nmap <leader>p :Git push<cr>
xnoremap <leader>p "_dP
nmap <leader>o :Files<cr>
nmap <leader>ff :GFiles<cr>
nmap <leader>h :History<cr>
nmap <leader>vc :Colors<cr>
nmap <silent> <leader>nf :enew<cr>
nmap <leader>d :pwd<cr>

" Split mappings
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C--> <C-w>-
nnoremap <C-=> <C-w>+

" Tab mappings
nnoremap <C-Left> gT
nnoremap <C-Right> gt
nnoremap <S-Left> :-tabmove<cr>
nnoremap <S-Right> :+tabmove<cr>

" Buffer mappings
nnoremap <leader>bb :ls<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bq :bd<cr>

" Terminal mappings
nnoremap <leader>vt :new term://bash<bar>resize 15<cr>
nnoremap <leader>vv :vnew term://bash<cr>
nnoremap <leader>jj :new<cr>:call termopen('julia')<bar>resize 15<cr>
nnoremap <leader>jv :vnew<cr>:call termopen('julia')<cr>
