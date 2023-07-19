language en_US.UTF-8

" Vim plug commands
" PlugStatus to check the status of plugins
" PlugInstall to install plugins
" To uninstall, delete Plug line, then PlugClean
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'dhruvasagar/vim-zoom'
Plug 'christoomey/vim-system-copy'
Plug 'vim-airline/vim-airline'
Plug 'kana/vim-textobj-user'
Plug 'tek/vim-textobj-ruby'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
" Plug 'vim-scripts/pink'
Plug 'scrooloose/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'elmcast/elm-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'AndrewRadev/splitjoin.vim'

call plug#end()

" set background=dark
" set background=light
" colorscheme hybrid
" colorscheme apprentice
" colorscheme monokai
" colorscheme jellybeans
" colorscheme gruvbox

" Pink
" colorscheme pink

" Gruvbox
set background=dark
let g:gruvbox_transparent_bg = 1
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_number_column = 'bg1'
colorscheme gruvbox

" Seoul256 background color range
" if you use this, the 'set background' will not work
" use 'colo instead'
" dark range    - 233 ~ 239
" light range   - 252 ~ 256

" Seoul256 dark
" let g:seoul256_background = 235
" colo seoul256

" Seoul256 light
" let g:seoul256_light_background = 256
" colo seoul256-light

" run matchit for HTML jumps with %
runtime macros/matchit.vim

" SnipMate
let g:snipMate = { 'snippet_version' : 1 }

" make jk or jj leave insert mode
inoremap jj <esc>

" NVIM 0.8 bug hack fix
let g:NERDTreeMinimalMenu=1

" Reload syntax highlighting with F12
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" Buffer switching
nnoremap <F5> :Buffers<CR>

" No highlight on enter
nnoremap <silent> <CR> :nohlsearch<CR><CR>

" Remap Files fzf
map <leader>t :Files<CR>
map <leader>ts :Files src/<CR>
map <leader>ta :Files app/<CR>
map <leader>ts :Files spec/<CR>
map <leader>tc :Files config/<CR>

" map Git log of a file
map <leader>gh :Git log -p -- %<CR>

" map NERDTreeFind
map <leader>nt :NERDTree<CR>
map <leader>\ :NERDTreeFind<CR>

" Clear white spaces
map <leader>cw :%s/\s\+$//e<CR>

" Ag search selected
" map <leader>g :exe 'Ag!' expand('<cword>')<CR>
map <leader>g "hy:Ag <C-r>h<CR>

" FZF fuzzy search history
map <leader>r :History:<CR>

" tags setup
set tags^=./tags;

" I DON'T KNOW WHAT THIS IS, JUST TURNED IT OFF
" filetype plugin indent on

" Open vue files as html
au FileType vue set filetype=html.javascript

" add jbuilder syntax highlighting
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

" Auto remove trailing whitespace on save
" I've been using <leader>cw all the time, this ain't needed
" autocmd FileType rb,js,go,php,vue,html autocmd BufWritePre <buffer> %s/\s\+$//e

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

" set search count
set shortmess-=S

" set vertical split right
set splitright

" highlight every matched pattern
set incsearch

" case insensitive on search
set ic

" Set hidden will hide unsaved files instead of closing it.
" For now, I'm using it for search and replace multiple sources
set hidden

" Limit mouse mode only to visual mode
set mouse=v

" Teach vim to syntax highlight Vagrantfile as ruby
"
" Install: $HOME/.vim/plugin/vagrant.vim
" Author: Brandon Philips <brandon@ifup.org>

" https://stackoverflow.com/questions/21316727/automatic-closing-brackets-for-vim
" Also consider auto-pairs plugin https://github.com/jiangmiao/auto-pairs
" Auto close brackets
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O

augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

" -- YAML
function! YAMLTree()
  let l:list = []
  let l:cur = getcurpos()[1]
  " Retrieve the current line indentation
  let l:indent = indent(l:cur) + 1
  " Loop from the cursor position to the top of the file
  for l:n in reverse(range(1, l:cur))
      let l:i = indent(l:n)
      let l:line = getline(l:n)
      let l:key = substitute(l:line, '^\s*\(\<\w\+\>\):.*', "\\1", '')
      " If the indentation decreased and the pattern matched
      if (l:i < l:indent && l:key !=# l:line)
          let l:list = add(l:list, l:key)
          let l:indent = l:i
      endif
  endfor
  let l:list = reverse(l:list)
  echo join(l:list, '.')
  return join(l:list, '.')
endfunction

" map yaml function
map <leader>ys :let @+ = substitute(YAMLTree(), "^[^\.]*\.", "", "")<CR>
map <leader>ya :let @+ .= "\n" . YAMLTree()<CR>

" -- ABBREVIATIONS
iab VUE <template>
      \<CR><div></div>
      \<CR></template>
      \<CR>
      \<CR><script>
      \<CR>export default {
      \<CR>name: 'Component',
      \<CR>}
      \<CR></script>

iab ELMST module Main exposing (main)
      \<CR>import Browser
      \<CR>import Html exposing (..)
      \<CR>-- MODEL
      \<CR>type alias Model = Int
      \<CR>init : Model
      \<CR>init = 0
      \<CR>-- UPDATE
      \<CR>update : msg -> Model -> Model
      \<CR>update msg model = model
      \<CR>-- VIEW
      \<CR>view : Model -> Html msg
      \<CR>view model = div [] [ text "Hello babanas" ]
      \<CR>main = Browser.sandbox { init = init, update = update, view = view }

iab ELMSPA module Main exposing (main)
      \<CR>import Browser
      \<CR>import Html exposing (..)
      \<CR>import Url
      \<CR>-- MODEL
      \<CR>type alias Model = Int
      \<CR>init : () -> url -> key -> ( Model, Cmd Msg )
      \<CR>init _ url key = ( 0, Cmd.none )
      \<CR>-- UPDATE
      \<CR>type Msg = UrlChange \| UrlRequest
      \<CR>update : Msg -> Model -> ( Model, Cmd Msg )
      \<CR>update msg model = ( model, Cmd.none )
      \<CR>onUrlChange : Url.Url -> Msg
      \<CR>onUrlChange url = UrlChange
      \<CR>onUrlRequest : Browser.UrlRequest -> Msg
      \<CR>onUrlRequest urlRequest = UrlRequest
      \<CR>subscriptions : Model -> Sub Msg
      \<CR>subscriptions model = Sub.none
      \<CR>-- VIEW
      \<CR>view : Model -> Browser.Document Msg
      \<CR>view model = { title = "Main title" , body = [ div [] [ text "Hello babanas" ] ] }
      \<CR>main = Browser.application { init = init , update = update , view = view , onUrlChange = onUrlChange , onUrlRequest = onUrlRequest , subscriptions = subscriptions }
