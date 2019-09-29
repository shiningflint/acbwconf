language en_US.UTF-8

" Vim plug commands
" PlugStatus to check the status of plugins
" PlugInstall to install plugins
" To uninstall, delete Plug line, then PlugClean
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
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set background=dark
" colorscheme hybrid
" colorscheme apprentice
" colorscheme jellybeans
colorscheme gruvbox

" make jk or jj leave insert mode
inoremap jj <esc>
inoremap jk <esc>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

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
