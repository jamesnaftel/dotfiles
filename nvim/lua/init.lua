local nvim_lsp = require'lspconfig'
local nvim_completion = require'completion'

local on_attach_vim = function(client)
  nvim_completion.on_attach(client)
end

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

local on_attach_vim_plus_keymaps = function(client)
  on_attach_vim(client)
  mapper('n', '1gD',        '<cmd> lua vim.lsp.buf.type_definition()<CR>')
  mapper('n', '<leader>rn', '<cmd> lua vim.lsp.buf.rename()<CR>')
  mapper('n', '<c-k>',      '<cmd> lua vim.lsp.buf.signature_help()<CR>')
  mapper('n', 'K',          '<cmd> lua vim.lsp.buf.hover()<CR>')
  mapper('n', 'g0',         '<cmd> lua vim.lsp.buf.document_symbol()<CR>')
  mapper('n', 'gD',         '<cmd> lua vim.lsp.buf.implementation()<CR>')
  mapper('n', 'gW',         '<cmd> lua vim.lsp.buf.workspace_symbol()<CR>')
  mapper('n', 'gd',         '<cmd> lua vim.lsp.buf.definition()<CR>')
  mapper('n', 'gdd',        '<cmd> lua vim.lsp.buf.declaration()<CR>')
  mapper('n', 'gr',         '<cmd> lua vim.lsp.buf.references()<CR>')
  mapper('n', 'gR',         '<cmd> lua vim.lsp.buf.rename()<CR>')
  mapper('n', '<Leader>[',         '<cmd>lua vim.lsp.strutures.Diagnostics.buf_move_next_diagnostic()<CR>')
  mapper('n', '<Leader>]',         '<cmd>lua vim.lsp.strutures.Diagnostics.buf_move_prev_diagnostic()<CR>')
end

-- Python
nvim_lsp.pyls.setup({
  on_attach=on_attach_vim_plus_keymaps
})

-- Rust
nvim_lsp.rust_analyzer.setup({
	cmd = {"rust-analyzer"},
	on_attach=on_attach_vim_plus_keymaps,
})

-- Ruby
nvim_lsp.solargraph.setup({
		on_attach=on_attach_vim_plus_keymaps,
})

-- Terraform
nvim_lsp.terraformls.setup({
  on_attach=on_attach_vim_plus_keymaps,
  cmd = {"terraform-ls", "serve"},
  root_dir = nvim_lsp.util.root_pattern(".terraform", ".git");
})

require'colorizer'.setup()
