" Custom filetype mappings
autocmd FileType c,cpp noremap <leader>mm :!make<cr>
autocmd FileType c,cpp noremap <leader>mt :!make test<cr>
autocmd FileType c,cpp noremap <leader>mc :!make clean<cr>
autocmd FileType ruby nnoremap <buffer> <leader>rt :exec "!ruby " . expand("%:r") . "_test." . expand("%:e")<cr>
autocmd FileType ruby nnoremap <buffer> <leader>rr :!ruby %<cr>

