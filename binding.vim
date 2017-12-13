"""""""""""""""""""""""""""""
" Key binding
"""""""""""""""""""""""""""""

" Map leader to ,
let mapleader = " "
let g:mapleader = " "

" Move into splits
map <leader><up>      <C-w><up>
map <leader><down>    <C-w><down>
map <leader><right>   <C-w><right>
map <leader><left>    <C-w><left>

" Misc bindings
map <leader>d         :YcmCompleter GoTo<CR>
map <leader>o         :BufExplorer<CR>
map <leader>D         :Dox<CR>

map <F2>              :NERDTreeToggle<CR>
