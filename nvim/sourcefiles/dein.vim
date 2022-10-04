set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('~/.config/nvim/bundle')

call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
call dein#add('neovim/nvim-lspconfig')
call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'], 'build': 'cd app && sh ./install.sh' })
call dein#add('hrsh7th/cmp-nvim-lsp')
call dein#add('hrsh7th/cmp-buffer')
call dein#add('hrsh7th/cmp-path')
call dein#add('hrsh7th/cmp-cmdline')
call dein#add('hrsh7th/nvim-cmp')
call dein#add('L3MON4D3/LuaSnip')
call dein#add("rafamadriz/friendly-snippets")
call dein#add('saadparwaiz1/cmp_luasnip')
call dein#add('glepnir/dashboard-nvim')
call dein#add('JuliaEditorSupport/julia-vim')
call dein#add('catppuccin/nvim', {'as': 'catppuccin'})
call dein#add('nvim-treesitter/nvim-treesitter', {'hook_post_update': 'TSUpdate'})
call dein#add('nvim-treesitter/nvim-treesitter-context')
call dein#add('nvim-lua/plenary.nvim')
call dein#add('nvim-telescope/telescope.nvim', { 'rev': '0.1.0' })
" or                                         , { 'rev': '0.1.x' })
call dein#add('nvim-telescope/telescope-file-browser.nvim')
call dein#end()

if dein#check_install()
	call dein#install()
endif
