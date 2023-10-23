" This line makes pacman-installed global Arch Linux vim packages work.
source /usr/share/nvim/archlinux.vim

" Modules
runtime	keybinds.vim
runtime config.vim
runtime commenter.vim

call plug#begin()

" Completition Plugins
Plug 'ncm2/ncm2' 		"Completition Manager
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'   "Python completitions
Plug 'ncm2/ncm2-ultisnips'

Plug 'SirVer/ultisnips' 	"Snipets
Plug 'honza/vim-snippets' 	"More Snipets
Plug 'jiangmiao/auto-pairs' "quote/bracket pair Completition
Plug 'ervandew/supertab'    "tab for all completitions
" Visual Plugins
Plug 'nathanaelkane/vim-indent-guides' 		            "Add blocky indent guides
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }   "Add Hex color display

" Commenter Plugin
Plug 'scrooloose/nerdcommenter'

call plug#end()

"ncm2 settings
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c
inoremap <c-c> <ESC>
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
let g:ncm2#matcher = 'substrfuzzy'

inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsExpandTrigger = "<Enter>"

let g:SuperTabDefaultCompletionType = "<c-n>"
