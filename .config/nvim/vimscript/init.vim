" Vim-Plug plugins
call plug#begin()

Plug 'junegunn/fzf' , { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'rebelot/kanagawa.nvim'

Plug 'dylanaraps/wal.vim'

Plug 'neovim/nvim-lspconfig'

Plug 'm4xshen/autoclose.nvim'

call plug#end()

" Config sourcing
let $CONFIG_DIR = "~/.config/nvim/vimscript"
source $CONFIG_DIR/keybindings.vim

" show numbers on screenborder
set number

" open new windows below current one per default
set splitbelow

" use xclip as neovim clipboard
set clipboard+=unnamedplus

" set tabsize to 4
set tabstop=4
