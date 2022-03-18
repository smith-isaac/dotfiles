" Custom filetype mappings
autocmd FileType c,cpp noremap <leader>mm :!make<cr>
autocmd FileType c,cpp noremap <leader>mt :!make test<cr>
autocmd FileType c,cpp noremap <leader>mc :!make clean<cr>
autocmd FileType c,cpp noremap <leader>mb :!bear make<cr>
autocmd FileType ruby nnoremap <buffer> <leader>rt :exec "!ruby " . expand("%:r") . "_test." . expand("%:e")<cr>
autocmd FileType ruby nnoremap <buffer> <leader>rr :!ruby %<cr>
autocmd FileType julia nnoremap <buffer> <leader>rr :!julia %<cr>
autocmd FileType c,cpp,ruby nnoremap <buffer> <leader>es :exec "!exercism submit " . @%<cr>
autocmd FileType markdown nnoremap <buffer> <leader>md :MarkdownPreviewToggle<cr>
autocmd FileType tex nnoremap <buffer> <leader>ll :TexlabBuild<cr>
autocmd FileType tex nnoremap <buffer> <silent> <leader>lv :silent exec "!xdg-open " . expand("%:r") . ".pdf"<cr>
autocmd FileType tex nnoremap <buffer> <leader>lb :exec "!biber " . expand("%:r") . ".bcf"<cr>

autocmd FileType ruby set shiftwidth=2
autocmd FileType make set shiftwidth=4
autocmd FileType tex set foldcolumn=3
