" TODO(james) reorg this file

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

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Easy save
nnoremap <leader>w :w!<cr>

" Easy terminal
nnoremap <leader>tt :terminal<cr>

" Close quickfix easily
nnoremap <leader>a :cclose<CR>

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Center the screen
nnoremap <space> zz

" Do not show stupid q: window
map q: :q

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

nnoremap <F6> :setlocal spell! spell?<CR>

nnoremap <silent> <leader>q :Sayonara<CR>

" Just go out in insert mode
imap jk <ESC>l
imap JK <ESC>l

nnoremap <Leader>q" ciw""<Esc>P
nnoremap <Leader>q' ciw''<Esc>P

" Vimux
nnoremap <Leader>rs :call VimuxRunCommand("clear; " . fnamemodify(bufname(1), ':p'))<CR>
nnoremap <Leader>vmd :call VimuxRunCommand("clear; asciidoctor " . expand("%:p") . "; open " . expand("%:p:r") . ".html")<CR>
nnoremap <Leader>vp :VimuxPromptCommand<CR>
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
nnoremap <Leader>vi :VimuxInspectRunner<CR>
nnoremap <Leader>vz :VimuxZoomRunner<CR>

" Telescope settings
nnoremap <leader>tf <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <silent><leader>tg <cmd>lua require'telescope.builtin'.live_grep{}<CR>
nnoremap <silent><leader>tp <cmd>lua require'telescope.builtin'.live_grep{ type_filter = "py" }<CR>
nnoremap <silent><leader>ts <cmd>lua require'telescope.builtin'.grep_string{}<CR>
nnoremap <silent><leader>tgp <cmd>lua require'telescope.builtin'.git_files{}<CR>
nnoremap <silent><leader>fz <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find{}<CR>
nnoremap <silent><leader>vv <cmd>lua require('telescope.builtin').find_files{ cwd = "$HOME/.config/nvim"}<CR>
nnoremap <silent><leader>vr <cmd>lua require('telescope.builtin').live_grep{ cwd = "$HOME/.config/nvim"}<CR>
nnoremap <leader>f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ results_width=0.8}))<cr>

" Markdown
nnoremap <Leader>mp :MarkdownPreviewToggle<CR>
