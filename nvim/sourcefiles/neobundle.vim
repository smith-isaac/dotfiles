" Neobundle config file, separated from the init.vim file
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" call neobundle#begin(expand('~/.config/nvim/bundle/'))

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
NeoBundle 'preservim/nerdcommenter'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
NeoBundle 'junegunn/fzf'
NeoBundle 'junegunn/fzf.vim'
"NeoBundle 'voldikss/vim-floaterm'
NeoBundle 'neovim/nvim-lspconfig'
NeoBundle 'iamcco/markdown-preview.nvim'
" Bundles required by nvim-cmp
" Removing these since I don't really want them right now
NeoBundle 'hrsh7th/cmp-nvim-lsp'
NeoBundle 'hrsh7th/cmp-buffer'
NeoBundle 'hrsh7th/cmp-path'
NeoBundle 'hrsh7th/cmp-cmdline'
NeoBundle 'hrsh7th/nvim-cmp'
NeoBundle 'hrsh7th/cmp-vsnip'
NeoBundle 'hrsh7th/vim-vsnip'

" Dashboard
NeoBundle 'glepnir/dashboard-nvim'

" Coc
" NeoBundle 'neoclide/coc.nvim', 'release'
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

