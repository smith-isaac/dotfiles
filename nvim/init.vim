set number
set rnu
set scrolloff=8
set sidescrolloff=8
set shiftwidth=4
set hidden
filetype on
set spell
" set splitbelow
set splitright
" set cursorline

" Required:
" set runtimepath+=~/.vim/bundle/neobundle.vim/
set runtimepath+=~/.config/nvim/bundle/neobundle.vim/

" NeoBundle Source File
source $HOME/.config/nvim/sourcefiles/neobundle.vim

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

let g:airline_theme='deus'

source ~/.config/nvim/sourcefiles/mappings.vim

let g:fzf_ags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

source ~/.config/nvim/sourcefiles/languages.vim
" source ~/.config/nvim/sourcefiles/coc.vim
" source ~/.config/nvim/sourcefiles/lsp-config.vim
" Nvim-cmp.vim has lsp-config setup params in it already
source ~/.config/nvim/sourcefiles/nvim-cmp.vim
source ~/.config/nvim/sourcefiles/nerdcommenter.vim

" Not using nvim-cmp right now so I am disabling the nvim-cmp config file

" let g:coc_global_extensions = ['coc-clangd', 'coc-solargraph', 'coc-pyright']

