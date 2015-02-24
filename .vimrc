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
Bundle 'https://github.com/mattn/emmet-vim'

" turn filetypes back on since we're done loading plugins
filetype on

"" configure plugins
"  syntastic
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
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


colorscheme desertEx
set t_Co=256
set hlsearch

syntax on
filetype plugin indent on
set encoding=utf-8
setglobal fileencoding=utf-8

noremap <leader>s :update<CR>

set backupdir=~/.vim/backups
set directory=~/.vim/backups
set backup

set undofile
set undodir=~/.vim/undodir
set undolevels=10000
set undoreload=10000

" Remove any trailing whitespace that is in the file
" autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

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

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

set colorcolumn=81
set nu
highlight LineNr ctermfg=DarkGray

nor  <up>     ddkP
nor  <down>   ddp
nor  <left>   <<
nor  <right>  >>


" automate surroundings
inoremap { {}<left>
inoremap ( ()<left>
inoremap [ []<left>

inoremap " ""<left>
inoremap ' ''<left>
inoremap "" "
inoremap '' '
inoremap """<CR> """<CR>"""<C-o>O
inoremap '''<CR> '''<CR>'''<C-o>O

inoremap () ()
inoremap {} {}
inoremap [] []

inoremap <> <><left>
inoremap <?= <?=<space>?><left><left><left>
inoremap <? <?<space>?><left><left><left>

inoremap {<CR> {<CR><CR>}<up><BS><CR>
inoremap (<CR> (<CR><CR>)<up><BS><CR>
inoremap [<CR> [<CR><CR>]<up><BS><CR>

inoremap <C-j> <left><C-o>/[)}"'\]>]<CR><C-o>:nohl<CR><right>

vnoremap <Leader>s :sort<CR>
noremap Y y$


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
