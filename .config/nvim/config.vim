" Config file to alter nvim variables
" 
filetype plugin on
" 
" Set Window title
set title
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
let g:Hexokinase_highlighters = ['foregroundfull']      " Show hexcode colors
autocmd VimEnter * HexokinaseTurnOn
autocmd VimEnter * IndentGuidesEnable
