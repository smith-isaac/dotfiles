function ViewPDF(file)
    echom "Show " . a:file . ".pdf"
    silent exec "!xdg-open " . a:file . ".pdf"
endfunction

function Biber(file)
    echom "Running biber on " . a:file . ".bcf"
    exec "!biber " . a:file . ".bcf"
endfunction

nnoremap <buffer> <leader>ll :TexlabBuild<cr>
nnoremap <buffer> <silent> <leader>lv :call ViewPDF(expand("%:r"))<cr>
nnoremap <buffer> <leader>lb :call Biber(expand("%:r"))<cr>
set foldcolumn=3

" Some initial mappings based on vim-latex
inoremap `a \alpha
inoremap `b \beta
inoremap `g \gamma
inoremap `d \delta
inoremap `e \varepsilon
