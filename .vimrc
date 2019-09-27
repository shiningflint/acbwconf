language en_US.UTF-8

" Vim plug commands
" PlugStatus to check the status of plugins
" PlugInstall to install plugins
" Plug 'w0ng/vim-hybrid'
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-system-copy'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'posva/vim-vue'
Plug 'w0ng/vim-hybrid'

call plug#end()

set background=dark
colorscheme hybrid

filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

set backspace=2 " make backspace work like most other programs

set number

" set highlight search
set hlsearch
