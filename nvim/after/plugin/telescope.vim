" Telescope settings
nnoremap <leader>tf <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <silent><leader>tg <cmd>lua require'telescope.builtin'.live_grep{}<CR>
nnoremap <silent><leader>tp <cmd>lua require'telescope.builtin'.git_files{}<CR>
nnoremap <silent><leader>fz <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find{}<CR>
nnoremap <silent><leader>vv <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/.config/dotfiles/nvim" }<CR>
nnoremap <leader>f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ results_width=0.8}))<cr>
