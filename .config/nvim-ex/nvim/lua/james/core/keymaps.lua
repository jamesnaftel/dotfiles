local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("i", "jk", "<ESC>l")
vim.keymap.set("n", '<leader><space>', '<cmd>nohlsearch<CR>')

vim.keymap.set("n", "<leader>sv", ":luafile $MYVIMRC<CR>")

vim.keymap.set("n", "<leader>w", ":w!<CR>")

vim.keymap.set("n", "<space>", "zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "-", "<cmd>:Ex<CR>")

-- https://github.com/neovim/nvim-lspconfig/blob/master/plugin/lspconfig.lua
vim.api.nvim_create_user_command('LspInfo', ':checkhealth vim.lsp', { desc = 'Alias to `:checkhealth vim.lsp`' })

vim.keymap.set("n", "<C-x>", ":bnext<CR>")
vim.keymap.set("n", "<C-z>", ":bprev<CR>")

vim.keymap.set("n", "q:", ":q")
vim.keymap.set("n", "<leader>q", ":bd<CR>")

vim.keymap.set("n", "<leader>sp", ":setlocal spell! spell?<CR>")

-- Move Split Panes with more Vimlike Motions
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")




