set formatprg="pointfree --stdin"
compiler ghc

nnoremap <silent> <leader>o <Esc>:call ApplyOneSuggestion()<CR>
nnoremap <silent> <leader>a <Esc>:call ApplyAllSuggestions()<CR>

set wildignore+=*.o,*.hi
