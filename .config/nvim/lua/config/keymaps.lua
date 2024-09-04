
vim.keymap.set("i", "jk", "<ESC>l")

vim.keymap.set("n",'<leader><space>', '<cmd>nohlsearch<CR>')

vim.keymap.set("n","<leader>ev", ":vsplit $MYVIMRC<CR>")
vim.keymap.set("n","<leader>sv", ":luafile $MYVIMRC<CR>")

vim.keymap.set("n","<leader>w", ":w!<CR>")

vim.keymap.set("n","<leader>tt", ":terminal<cr>")

vim.keymap.set("n","<leader>a", ":cclose<CR>")

vim.keymap.set("n","<space>", "zz")

vim.keymap.set("n","q:", ":q")

vim.keymap.set("n","<leader>sp", ":setlocal spell! spell?<CR>")

vim.keymap.set("n","<leader>q", ":bd<CR>")

--vim.keymap.set("n","<leader>mp", ":MarkdownPreviewToggle<CR>")

-- Move Split Panes with more Vimlike Motions
vim.keymap.set("n","<C-j>", "<C-w>j")
vim.keymap.set("n","<C-k>", "<C-w>k")
vim.keymap.set("n","<C-h>", "<C-w>h")
vim.keymap.set("n","<C-l>", "<C-w>l")


vim.keymap.set("n", "-", "<cmd>:Ex<CR>")

vim.keymap.set("n", "<C-x>", ":bnext<CR>")
vim.keymap.set("n", "<C-z>", ":bprev<CR>")
