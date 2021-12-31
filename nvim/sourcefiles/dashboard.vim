let g:mapleader="\<Space>"
let g:dashboard_default_executive ='fzf'

" let g:dashboard_custom_header =<< EOF
"               .,-:;//;:=,
"           . :H@@@MM@M#H/.,+%;,
"        ,/X+ +M@@M@MM%=,-%HMMM@X/,
"      -+@MM; $M@@MH+-,;XMMMM@MMMM@+-
"     ;@M@@M- XM@X;. -+XXXXXHHH@M@M#@/.
"   ,%MM@@MH ,@%=             .---=-=:=,.
"   =@#@@@MX.,                -%HX$$%%%:;
"  =-./@M@M$                   .;@MMMM@MM:
"  X@/ -$MM/                    . +MM@@@M$
" ,@M@H: :@:                    . =X#@@@@-
" ,@@@MMX, .                    /H- ;@M@M=
" .H@@@@M@+,                    %MM+..%#$.
"  /MMMM@MMH/.                  XM@MH; =;
"   /%+%$XHH@$=              , .H@@@@MX,
"    .=--------.           -%H.,@@@@@MX,
"    .%MM@@@HHHXX$$$%+- .:$MMX =M@@MM%.
"      =XMMM@MM@MM#H;,-+HMM@M+ /MMMX=
"        =%@M@M#@$-.=$@MM@@@M; %M%=
"          ,:+$+-,/H#MMMMMMM@= =,
"                =++%%%%+/:-.
" EOF

let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]

nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

" let g:dashboard_custom_shortcut = {
"             \ 'find_file'	: 'SPC o',
"             \}
