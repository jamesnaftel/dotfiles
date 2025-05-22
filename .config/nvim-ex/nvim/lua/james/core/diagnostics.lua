local signs = {
  [vim.diagnostic.severity.ERROR] = " ",
  [vim.diagnostic.severity.WARN]  = " ",
  [vim.diagnostic.severity.HINT]  = "󰠠 ",
  [vim.diagnostic.severity.INFO]  = " ",
}

-- Set the diagnostic config with all icons
vim.diagnostic.config({
  signs = {
    text = signs            -- Enable signs in the gutter
  },
  virtual_text = true,      -- Specify Enable virtual text for diagnostics
  underline = true,         -- Specify Underline diagnostics
  update_in_insert = false, -- Keep diagnostics active in insert mode
})

-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>lx", function()
  isLspDiagnosticsVisible = not isLspDiagnosticsVisible
  vim.diagnostic.config({
    virtual_text = isLspDiagnosticsVisible,
    underline = isLspDiagnosticsVisible
  })
end, { desc = "Toggle LSP diagnostics" })
