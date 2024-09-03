local status, telescope = pcall(require, "telescope")
if (not status) then return end

telescope.setup({
    defaults = {
 		color_devicons = true,
        prompt_prefix = ' >> ',


 		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    }
})

local nnoremap = require("james.keymap").nnoremap
local builtin = require('telescope.builtin')

--  Telescope settings
vim.keymap.set('n', "<leader>tg", builtin.live_grep, {}) -- better?
nnoremap("<leader>tf", 	"<cmd>lua require('telescope.builtin').find_files()<CR>")
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

