vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.python3_host_prog = os.getenv("HOME") .. "/.venvs/nvim/bin/python"
vim.g.loaded_python_provider = 0

vim.g.netrw_banner = 0

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 10

vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250
vim.opt.timeoutlen = 500

vim.opt.inccommand = 'split'

vim.opt.cursorline = true

vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.background = 'dark'
vim.opt.scrolloff = 8
