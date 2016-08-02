" This must be first, because it changes other options as a side effect.
set nocompatible

" prepare for loading of plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'https://github.com/gmarik/Vundle.vim.git'
Bundle 'https://github.com/xolox/vim-misc.git'

"-----------------------------------------------

Bundle 'https://github.com/altercation/vim-colors-solarized.git'
Bundle 'https://github.com/bling/vim-airline.git'
Bundle 'https://github.com/vim-airline/vim-airline-themes.git'
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

"-----------------------------------------------

Bundle 'https://github.com/ervandew/supertab.git'
" would prefer for this to be 1 but it breaks smartinput
let g:SuperTabCrMapping = 0
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<C-p>"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<C-x><C-o>"]
autocmd FileType * 
      \if &omnifunc != '' |
          \call SuperTabChain(&omnifunc, "<C-p>") |
          \call SuperTabSetDefaultCompletionType("<C-x><C-o>") |
      \endif
" this is actually related to supertab, because it keeps opening
" the preview window and its annoying
set completeopt-=preview

Bundle 'https://github.com/scrooloose/syntastic'
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

Bundle 'https://github.com/majutsushi/tagbar.git'
nmap <F8> :TagbarToggle<CR>

Bundle 'https://github.com/kana/vim-smartinput.git'
Bundle 'https://github.com/xolox/vim-easytags.git'
set tags=tags
let g:easytags_async = 1
let g:easytags_auto_highlight = 0

"-----------------------------------------------

Bundle 'https://github.com/ctrlpvim/ctrlp.vim'
let g:ctrlp_extensions = ['tab', 'buffertag', 'mixed', 'undo', 'quickfix']
nnoremap <C-f> :CtrlPBufTag<CR>
nnoremap <A-p> :CtrlPBuffer<CR>

Bundle 'https://github.com/Lokaltog/vim-easymotion.git'
nmap , <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

Bundle 'https://github.com/ivalkeen/vim-ctrlp-tjump.git'
nnoremap <C-]> :CtrlPtjump<CR>
vnoremap <C-]> :CtrlPtjumpVisual<CR>
let g:ctrlp_tjump_only_silent = 1
let g:ctrlp_custom_ignore = 'node_modules'

"-----------------------------------------------

Bundle 'https://github.com/cakebaker/scss-syntax.vim.git'
Bundle 'https://github.com/fatih/vim-go.git'
Bundle 'https://github.com/lukerandall/haskellmode-vim.git'
let g:haddock_browser = "/usr/bin/google-chrome-stable"

Bundle 'https://github.com/mpickering/hlint-refactor-vim.git'
let g:hlintRefactor#disableDefaultKeybindings = 1

Bundle 'https://github.com/klen/python-mode.git'
let g:pymode_folding = 0
let g:pymode_lint_cwindow = 0
let g:pymode_lint_ignore = "E501"
let g:pymode_trim_whitespaces = 0
let g:pymode_rope = 0

Bundle 'https://github.com/marijnh/tern_for_vim.git'
Bundle 'https://github.com/shawncplus/phpcomplete.vim.git'
let php_htmlInStrings=1

"-----------------------------------------------

Bundle 'https://github.com/tpope/vim-surround.git'
Bundle 'https://github.com/terryma/vim-expand-region.git'

"-----------------------------------------------

Bundle 'https://github.com/tmhedberg/matchit.git'
Bundle 'https://github.com/tpope/vim-abolish.git'

"-----------------------------------------------

Bundle 'https://github.com/rbgrouleff/bclose.vim.git'
Bundle 'https://github.com/mbbill/undotree.git'
nnoremap <F7> :UndotreeToggle<CR>
let g:undotree_WindowLayout = 4
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif

Bundle 'https://github.com/beloglazov/vim-online-thesaurus.git'

"-----------------------------------------------

Bundle 'https://github.com/SirVer/ultisnips.git'
let g:UltiSnipsExpandTrigger="<C-f>"
let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
let g:snips_author="Aiden Hall"

Bundle 'https://github.com/AidenRHall/vim-snippets.git'

"-----------------------------------------------

Bundle 'https://github.com/vim-scripts/vcscommand.vim.git'
Bundle 'https://github.com/tpope/vim-fugitive.git'
Bundle 'https://github.com/airblade/vim-gitgutter.git'

"-----------------------------------------------

Bundle 'https://github.com/mattn/emmet-vim.git'
Bundle 'https://github.com/AndrewRadev/splitjoin.vim.git'
Bundle 'https://github.com/junegunn/vim-easy-align.git'
Bundle 'https://github.com/tpope/vim-commentary.git'
Bundle 'https://github.com/tpope/vim-repeat.git'


" turn filetypes back on since we're done loading plugins
filetype on


" functions
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

function! DeleteFile(...)
  if(exists('a:1'))
    let theFile=a:1
  elseif ( &ft == 'help' )
    echohl Error
    echo "Cannot delete a help buffer!"
    echohl None
    return -1
  else
    let theFile=expand('%:p')
  endif
  let delStatus=delete(theFile)
  if(delStatus == 0)
    execute 'bd!'
    echo "Deleted " . theFile
  else
    echohl WarningMsg
    echo "Failed to delete " . theFile
    echohl None
  endif
  return delStatus
endfunction

"delete the current file
com! Rm call DeleteFile()


colorscheme solarized
set term=xterm-256color
set t_Co=256
set background=dark
set hlsearch

" make insert mode curor appear thin -- konsole only!
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" same thing for tmux
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

" Remove trailing whitespace
" autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$/\1/ge | endif

let mapleader=" "

nnoremap <C-j> 15j15<C-e>
nnoremap <C-k> 15k15<C-y>

nnoremap <C-s> :update<CR>
inoremap <C-s> <esc>:update<CR>


" navigation
nnoremap <silent> <C-Up> :lprevious<CR>
nnoremap <silent> <C-Down> :lnext<CR>

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

nnoremap <C-l> :call NumberToggle()<cr>
nmap ga <Plug>(EasyAlign)
nnoremap Y y$
nnoremap g] :CtrlPtjump<CR>

inoremap <C-d> <esc>A<CR>
inoremap <C-j> <esc>A;<CR>
inoremap <C-e> <esc>A;<esc>

nnoremap g] :CtrlPtjumpVisual<CR>
vnoremap <leader>s :sort<CR>
vnoremap // y/<C-r>"<CR>
vmap <Enter> <Plug>(EasyAlign)
