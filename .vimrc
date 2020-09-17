language en_US.UTF-8

" Vim plug commands
" PlugStatus to check the status of plugins
" PlugInstall to install plugins
" To uninstall, delete Plug line, then PlugClean
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-system-copy'
Plug 'vim-airline/vim-airline'
Plug 'crusoexia/vim-monokai'
Plug 'junegunn/seoul256.vim'
Plug 'scrooloose/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'carmonw/elm-vim'

call plug#end()

set background=dark
" colorscheme hybrid
" colorscheme apprentice
" colorscheme monokai
" colorscheme jellybeans
" colorscheme gruvbox
let g:seoul256_background = 235
colorscheme seoul256

" run matchit for HTML jumps with %
runtime macros/matchit.vim

" make jk or jj leave insert mode
inoremap jj <esc>

" Reload syntax highlighting with F12
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" Remap Files fzf
map <leader>t :Files<CR>
map <leader>ts :Files src/<CR>
map <leader>ta :Files app/<CR>

" map NERDTreeFind
map <leader>\ :NERDTreeFind<CR>

" tags setup
set tags^=./.git/tags;

filetype plugin indent on

" Open vue files as html
" autocmd BufRead,BufNewFile *.vue setfiletype html
au FileType vue set filetype=html.javascript

" Auto remove trailing whitespace on save
autocmd FileType rb,js,go,php,vue,html autocmd BufWritePre <buffer> %s/\s\+$//e

set dir=$HOME/.vim/tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

set backspace=2 " make backspace work like most other programs

set number

" set relativenumber for relative line
set relativenumber

" set highlight search
set hlsearch

" set vertical split right
set splitright

" highlight every matched pattern
set incsearch

" case insensitive on search
set ic
