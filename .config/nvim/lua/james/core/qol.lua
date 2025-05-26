-- Quality of Life

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  nested = true,
  callback = function()
    pcall(vim.cmd.colorscheme, vim.g.SCHEME)
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function(params)
    vim.g.SCHEME = params.match
  end,
})

-- Add the whitespace trimming function
local function trim_whitespace()
  local save = vim.fn.winsaveview() -- Save cursor position
  vim.cmd([[%s/\s\+$//e]])          -- Trim trailing whitespace
  vim.fn.winrestview(save)          -- Restore cursor position
end

-- Attach to BufWritePre event
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = trim_whitespace,
  desc = "Trim trailing whitespace on save",
})


