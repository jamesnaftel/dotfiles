local nnoremap = require("james.keymap").nnoremap
local inoremap = require("james.keymap").inoremap

nnoremap("<C-x>", ":bnext<CR>")
nnoremap("<C-z>", ":bprev<CR>")

nnoremap("-", "<cmd>:Ex<CR>")
-- nnoremap("<leader>ex", "<cmd>:Ex<CR>")

nnoremap("<leader>ev", ":vsplit $MYVIMRC<CR>")
nnoremap("<leader>sv", ":luafile $MYVIMRC<CR>")

-- Easy save
nnoremap("<leader>w", ":w!<CR>")

-- Easy terminal
nnoremap("<leader>tt", ":terminal<cr>")

-- Close quickfix easily
nnoremap("<leader>a", ":cclose<CR>")

-- Remove search highlight
nnoremap("<leader><space>", ":nohlsearch<CR>")

-- Center the screen
nnoremap("<space>", "zz")

nnoremap("q:", ":q")

-- Spell
nnoremap("<leader>sp", ":setlocal spell! spell?<CR>")

-- Just go out in insert mode
inoremap("jk", "<ESC>l")

-- Markdown previewer
nnoremap("<leader>mp", ":MarkdownPreviewToggle<CR>")

-- Move Split Panes with more Vimlike Motions
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-l>", "<C-w>l")

-- Close buffer
nnoremap("<leader>q", ":bd<CR>")
