" This line makes pacman-installed global Arch Linux vim packages work.
source /usr/share/nvim/archlinux.vim

" Modules
runtime	keybinds.vim
runtime config.vim

call plug#begin()

" Completition Plugins
Plug 'ncm2/ncm2' 		"Completition Manager
Plug 'SirVer/ultisnips' 	"Snipets
Plug 'honza/vim-snippets' 	"More Snipets
Plug 'ervandew/supertab' 	"Tab for all completitions

" Visual Plugins
"Plug 'nathanaelkane/vim-indent-guides' 		            "Add blocky indent guides
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }   "Add Hex color display

call plug#end()
