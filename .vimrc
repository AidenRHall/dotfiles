" This must be first, because it changes other options as a side effect.
set nocompatible

colorscheme solarized
set term=xterm-256color
set t_Co=256
set background=dark
set hlsearch

" make insert mode curor appear thin in tmux
if exists('$TMUX')
      let &t_SI = "\<Esc>[3 q"
      let &t_EI = "\<Esc>[0 q"
      " these two lines were outside the if statement
      " putting them here solves this issue although the cursor shape stays
      " the same in any mode outside tmux - but that's OK.
      let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
      let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

syntax on
filetype plugin indent on
set encoding=utf-8
setglobal fileencoding=utf-8

set ls=2
set nf=octal,hex,alpha

set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set incsearch

set showmatch
set matchtime=5

set autoindent

set tabpagemax=15
set expandtab
set softtabstop=4
set shiftwidth=4

set scrolloff=5

set colorcolumn=81
set nu
highlight LineNr ctermfg=DarkGray

let mapleader=" "

nnoremap <C-s> :update<CR>
inoremap <C-s> <esc>:update<CR>


" navigation
nnoremap <silent> <C-Up> :lprevious<CR>
nnoremap <silent> <C-Down> :lnext<CR>

" make alt+direction move between tabs intuitively
nnoremap <silent> <A-Left> :wincmd h<CR>
nnoremap <silent> <A-Right> :wincmd l<CR>
nnoremap <silent> <A-Up> :wincmd k<CR>
nnoremap <silent> <A-Down> :wincmd j<CR>

nnoremap <A-PageUp> :tabprevious<CR>
nnoremap <A-PageDown> :tabnext<CR>
nnoremap <leader>w :tabclose<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader><PageDown> :tabm +1<CR>
nnoremap <leader><PageUp> :tabm -1<CR>

nnoremap <leader>h :nohl<CR>

nnoremap <A-PageDown> :tn<CR>
nnoremap <A-PageUp> :tp<CR>

nnoremap  <Up>     ddkP
nnoremap  <Down>   ddp
nnoremap  <Left>   <<
nnoremap  <Right>  >>

nnoremap <C-w><C-]> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <C-w>] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

nnoremap Y y$

inoremap <C-d> <esc>A<CR>
inoremap <C-j> <esc>A;<CR>
inoremap <C-e> <esc>A;<esc>

vnoremap <leader>s :sort<CR>
vnoremap // y/<C-r>"<CR>
