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
            \ 'description': ['Edit init.nvim (<Space> v e)'],
            \ 'command': 'edit ~/.config/nvim/init.vim'},
        \ 'source_init': {
            \ 'description': ['Source init.nvim (<Space> v r)'],
            \ 'command': 'source ~/.config/nvim/init.vim'},
        \ 'find_file': {
            \ 'description': ['Find file in dir (<Space> o)'],
            \ 'command': 'Files'},
        \ 'new_file': {
            \ 'description': ['New file (<Space> n f)'],
            \ 'command': 'enew'},
        \ 'colors': {
            \ 'description': ['Change colors (<Space> v c)'],
            \ 'command': 'Colors'},
        \ 'recent': {
            \ 'description': ['Recent files (<Space> h)'],
            \ 'command': 'History'},
        \ 'git': {
            \ 'description': ['Open git (<Space> g)'],
            \ 'command': 'Git'},
            \}

" let g:dashboard_custom_footer = ['']
let g:dashboard_custom_footer = ['We do what we must because we can']
