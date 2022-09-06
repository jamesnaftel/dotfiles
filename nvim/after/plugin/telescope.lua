local nnoremap = require("james.keymap").nnoremap

--  Telescope settings
nnoremap("<leader>tf", 	"<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap("<leader>tg", 	"<cmd>lua require('telescope.builtin').live_grep{}<CR>")
nnoremap("<leader>tp", 	"<cmd>lua require('telescope.builtin').live_grep{ type_filter = 'py' }<CR>")
nnoremap("<leader>ts", 	"<cmd>lua require('telescope.builtin').grep_string{}<CR>")
nnoremap("<leader>tgp", "<cmd>lua require('telescope.builtin').git_files{}<CR>")
nnoremap("<leader>fz", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find{}<CR>")
nnoremap("<leader>tz", 	"<cmd>lua require('telescope.builtin').treesitter()<CR>")

-- Fun but useful?
nnoremap("<leader>tm", 	"<cmd>lua require('telescope.builtin').man_pages()<CR>")

-- Update these two
nnoremap("<leader>vv", "<cmd>lua require('telescope.builtin').find_files{ cwd = '$HOME/.config/nvim'}<CR>")
nnoremap("<leader>vr", "<cmd>lua require('telescope.builtin').live_grep{ cwd = '$HOME/.config/nvim'}<CR>")
