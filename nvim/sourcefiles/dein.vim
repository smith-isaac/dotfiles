set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('~/.config/nvim/bundle')

call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('tpope/vim-fugitive')
call dein#add('preservim/nerdtree')
call dein#add('preservim/nerdcommenter')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('ryanoasis/vim-devicons')
call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0})
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf'})
call dein#add('neovim/nvim-lspconfig')
call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'], 'build': 'cd app && sh ./install.sh' })
call dein#add('hrsh7th/cmp-nvim-lsp')
call dein#add('hrsh7th/cmp-buffer')
call dein#add('hrsh7th/cmp-path')
call dein#add('hrsh7th/cmp-cmdline')
call dein#add('hrsh7th/nvim-cmp')
" call dein#add('hrsh7th/cmp-vsnip')
" call dein#add('hrsh7th/vim-vsnip')
call dein#add('L3MON4D3/LuaSnip')
call dein#add('saadparwaiz1/cmp_luasnip')
call dein#add('glepnir/dashboard-nvim')

call dein#end()

if dein#check_install()
	call dein#install()
endif
