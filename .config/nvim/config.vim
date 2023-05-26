" Config file to alter nvim variables
" 
" Set Numbers on left side
set number
set numberwidth=2
"
" Redifine tab appearance of 8 spaces as 4
set tabstop=4
set shiftwidth=4
set expandtab 		" Redifines tab char as a group of space chars (also changes backspace behaviour)
" 
"
" Define Color Scheme
set termguicolors
colorscheme focuspoint 
" 
hi IndentGuidesOdd  ctermbg=black       " Indent Color Scheme
hi IndentGuidesEven ctermbg=darkgrey    " Indent Color Scheme
