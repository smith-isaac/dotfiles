source ~/.config/nvim/sourcefiles/settings.vim
source ~/.config/nvim/sourcefiles/dein.vim
source ~/.config/nvim/sourcefiles/mappings.vim
source ~/.config/nvim/sourcefiles/languages.vim
source ~/.config/nvim/sourcefiles/nerdcommenter.vim
source ~/.config/nvim/sourcefiles/dashboard.vim
source ~/.config/nvim/sourcefiles/fzf.vim

lua require("nvim-cmp")
lua require("lsp")

filetype plugin indent on
syntax enable
