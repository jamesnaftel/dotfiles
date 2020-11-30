nnoremap <C-x> :bnext<CR>
nnoremap <C-z> :bprev<CR>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

noremap <silent><leader>jq :%!python -m json.tool<cr>

" Move Split Panes with more Vimlike Motions
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
