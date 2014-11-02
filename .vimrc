" This must be first, because it changes other options as a side effect.
set nocompatible

" prepare for loading of plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/Vundle.vim'
Bundle 'https://github.com/bling/vim-airline'
Bundle 'https://github.com/kien/ctrlp.vim'
Bundle 'https://github.com/Lokaltog/vim-easymotion'
Bundle 'https://github.com/ervandew/supertab'
Bundle 'https://github.com/Valloric/YouCompleteMe'
Bundle 'https://github.com/tpope/vim-fugitive'
Bundle 'https://github.com/airblade/vim-gitgutter.git'
Bundle 'https://github.com/scrooloose/syntastic'

" turn filetypes back on since we're done loading plugins
filetype on

colorscheme desertEx
set t_Co=256
set hlsearch

syntax on
filetype plugin indent on
set encoding=utf-8
setglobal fileencoding=utf-8

noremap <leader>s :update<CR>

set backupdir=~/.vim_backups
set directory=~/.vim_backups
set backup
set autochdir

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

set ls=2
set nf=octal,hex,alpha

set backspace=indent,eol,start
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

set history=50
set ruler
set showcmd
set incsearch

set autoindent

set tabpagemax=15
setlocal expandtab
setlocal softtabstop=4
setlocal shiftwidth=4

set colorcolumn=81

ino  <up>     <NOP>
ino  <down>   <NOP>
ino  <left>   <NOP>
ino  <right>  <NOP>
nor  <up>     ddkP
nor  <down>   ddp
nor  <left>   <<
nor  <right>  >>

" making surroundings sane
inoremap { {}<esc>i
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap < <><esc>i
inoremap " ""<esc>i
inoremap ' ''<esc>i

inoremap () ()
inoremap {} {}
inoremap [] []

inoremap {<CR> {<CR>}<esc>O
inoremap (<CR> (<CR>)<esc>O
inoremap [<CR> [<CR>]<esc>O

inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a
inoremap <C-k> <Esc>/[({"'\[<]<CR>NN:nohl<CR>a

vnoremap <Leader>s :sort<CR>
noremap Y y$
