" This must be first, because it changes other options as a side effect.
set nocompatible

" prepare for loading of plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'https://github.com/gmarik/Vundle.vim.git'
Bundle 'https://github.com/ervandew/supertab.git'
Bundle 'https://github.com/bling/vim-airline.git'
Bundle 'https://github.com/kien/ctrlp.vim.git'
Bundle 'https://github.com/ivalkeen/vim-ctrlp-tjump.git'
Bundle 'https://github.com/tpope/vim-fugitive.git'
Bundle 'https://github.com/airblade/vim-gitgutter.git'
Bundle 'https://github.com/scrooloose/syntastic'
Bundle 'https://github.com/mattn/emmet-vim.git'
Bundle 'https://github.com/tpope/vim-surround.git'
Bundle 'https://github.com/Lokaltog/vim-easymotion.git'
Bundle 'https://github.com/SirVer/ultisnips.git'
Bundle 'https://github.com/AidenRHall/vim-snippets.git'
Bundle 'https://github.com/altercation/vim-colors-solarized.git'
Bundle 'https://github.com/tmhedberg/matchit.git'
Bundle 'https://github.com/vim-scripts/vcscommand.vim.git'
Bundle 'https://github.com/junegunn/vim-easy-align.git'
Bundle 'https://github.com/kana/vim-smartinput.git'

" turn filetypes back on since we're done loading plugins
filetype on

"" configure plugins
"  syntastic
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_error_symbol = "✗"                                           
let g:syntastic_warning_symbol = "⚠"

"  ctags
set tags=tags

" ctrlp
let g:ctrlp_tjump_only_silent = 1

" snippets
let g:UltiSnipsExpandTrigger="<C-n>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

" airline
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" functions
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc


colorscheme solarized
set background=dark
set t_Co=256
set hlsearch

" make insert mode curor appear thin -- konsole only!
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

syntax on
au BufNewFile,BufRead *.ctp set filetype=php
filetype plugin indent on
set encoding=utf-8
setglobal fileencoding=utf-8

set backupdir=~/.vim/backups
set directory=~/.vim/backups
set backup

set undofile
set undodir=~/.vim/undodir
set undolevels=10000
set undoreload=10000

set ls=2
set nf=octal,hex,alpha

set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set incsearch

set autoindent

set tabpagemax=15
set expandtab
set softtabstop=4
set shiftwidth=4

set scrolloff=5

set colorcolumn=81
set nu
highlight LineNr ctermfg=DarkGray

" Remove trailing whitespace
" autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$/\1/ge | endif

let mapleader=","

nnoremap <C-s> :update<CR>
inoremap <C-s> <esc>:update<CR>


" navigation
nnoremap <silent> <C-Up> :lprevious<CR>
nnoremap <silent> <C-Down> :lnext<CR>

nnoremap <silent> <A-Left> :wincmd h<CR>
nnoremap <silent> <A-Right> :wincmd l<CR>

nnoremap <A-PageUp> :tabprevious<CR>
nnoremap <A-PageDown> :tabnext<CR>
nnoremap <leader>w :tabclose<CR>
nnoremap <leader>t :tabnew<CR>

nnoremap <A-Up> :bp<CR>
nnoremap <A-Down> :bn<CR>

nnoremap <A-PageDown> :tn<CR>
nnoremap <A-PageUp> :tp<CR>

nnoremap  <Up>     ddkP
nnoremap  <Down>   ddp
nnoremap  <Left>   <<
nnoremap  <Right>  >>

nnoremap <C-w><C-]> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <C-w>] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

nnoremap <C-l> :call NumberToggle()<cr>
nmap ga <Plug>(EasyAlign)
nnoremap Y y$
nnoremap g] :CtrlPtjump<CR>

inoremap <A-j> <esc>A,<CR>
inoremap <C-j> <esc>A<CR>
inoremap <C-e> <esc>A;<esc>

inoremap <C-a> <esc>mtvip:EasyAlign =<CR>'ta

nnoremap g] :CtrlPtjumpVisual<CR>
vnoremap <leader>s :sort<CR>
vnoremap // y/<C-r>"<CR>
vmap <Enter> <Plug>(EasyAlign)
