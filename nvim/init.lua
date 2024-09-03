-- init.lua

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.python3_host_prog = '/Users/jamesnaftel/.pyenv/shims/python'
vim.g.loaded_python_provider = 0

vim.g.netrw_banner = 0

require("config.options")
require("config.keymaps")
require("config.qol")
require("config.lazy")
