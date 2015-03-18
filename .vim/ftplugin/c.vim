" set tab to 8 characters long
setlocal noexpandtab
setlocal shiftwidth=8
setlocal softtabstop=0
setlocal tabstop=8

inoremap <C-j> <esc>A;<CR>
inoremap ,,i #include<><left>

inoremap ,,m int<space>main(int<space>argc,<space>char<space>*argv[])<space>{<CR>return<space>0;<CR>}<esc>kO<CR><esc>kS
