local nvim_lsp = require'lspconfig'

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

local on_attach_vim_plus_keymaps = function(client)
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

vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})

-- Python
nvim_lsp.pyright.setup({
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach=on_attach_vim_plus_keymaps,
	filetypes = {"python"}
})
-- Rust
nvim_lsp.rust_analyzer.setup({
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
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
	filetypes = {"terraform", "hcl", "tf"},
  root_dir = nvim_lsp.util.root_pattern(".terraform", ".git");
})

-- Bash
nvim_lsp.bashls.setup({
	on_attach=on_attach_vim_plus_keymaps,
})

-- C/C++
nvim_lsp.clangd.setup({
	on_attach=on_attach_vim_plus_keymaps,
})

-- Go
nvim_lsp.gopls.setup({
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach=on_attach_vim_plus_keymaps,
})

-- JS and TS
nvim_lsp.tsserver.setup({
	on_attach=on_attach_vim_plus_keymaps,
})

require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
    -- require("neotest-plenary"),
    --require("neotest-vim-test")({
    --  ignore_file_types = { "python", "vim", "lua" },
    --}),
  },
	output = {
		enabled = true,
		open_on_run = "short"
	},
})

require('colorizer').setup()
require('Comment').setup()

lspkind = require('lspkind')
lspkind.init()

vim.g.snippets = "luasnip"
