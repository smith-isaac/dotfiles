let g:mapleader="\<Space>"
let g:dashboard_default_executive ='fzf'


let g:dashboard_custom_header =<< EOF
             _____________________      _____________________
            /*********************/    /*********************/
           /*********************/    /*********************/
          /*********************/    /*********************/
          ‾‾‾‾‾‾/*******/‾‾‾‾‾‾     /*******/‾‾‾‾‾‾‾‾‾‾‾‾‾
               /*******/           /*******/
              /*******/           /*******/_____________
             /*******/           /*********************/
            /*******/           /*********************/
           /*******/            ‾‾‾‾‾‾‾‾‾‾‾‾‾/*******/
          /*******/                         /*******/
   ______/*******/______     ______________/*******/
  /*********************/   /*********************/
 /*********************/   /*********************/
/*********************/   /*********************/
‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾     ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
EOF


" let g:dashboard_custom_header = [
" \ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
" \ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
" \ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
" \ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
" \ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
" \ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
" \]


let g:dashboard_custom_section={
        \ 'edit_init': {
            \ 'desc': ['Edit init.nvim (<Space> v e)'],
            \ 'action': 'edit ~/.config/nvim/init.vim'},
        \ 'source_init': {
            \ 'desc': ['Source init.nvim (<Space> v r)'],
            \ 'action': 'source ~/.config/nvim/init.vim'},
        \ 'find_file': {
            \ 'desc': ['Find file in dir (<Space> o)'],
            \ 'action': 'Files'},
        \ 'new_file': {
            \ 'desc': ['New file (<Space> n f)'],
            \ 'action': 'enew'},
        \ 'colors': {
            \ 'desc': ['Change colors (<Space> v c)'],
            \ 'action': 'Colors'},
        \ 'recent': {
            \ 'desc': ['Recent files (<Space> h)'],
            \ 'action': 'History'},
        \ 'git': {
            \ 'desc': ['Open git (<Space> g)'],
            \ 'action': 'Git'},
            \}

" let g:dashboard_custom_footer = ['']
let g:dashboard_custom_footer = ['We do what we must because we can']
