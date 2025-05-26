-- init.lua

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.python3_host_prog = '/Users/jamesnaftel/.pyenv/shims/python'
vim.g.loaded_python_provider = 0

vim.g.netrw_banner = 0

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

require("config.options")
require("config.keymaps")
require("config.qol")
require("config.lazy")

--vim.api.nvim_command('autocmd CursorMoved * hi! LspReferenceText guibg=NONE gui=NONE')
