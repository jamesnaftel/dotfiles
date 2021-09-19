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
	on_attach=on_attach_vim_plus_keymaps,
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
		on_attach=on_attach_vim_plus_keymaps,
})

nvim_lsp.jdtls.setup({
		on_attach=on_attach_vim_plus_keymaps,
		-- This is a hack that I need to revisit when I have time.
		cmd = {"bash", "-c", "/Users/jamesnaftel/dev/git-env/envfiles/nvim/scripts/nvim-jdtls.sh"}
})

-- efm-langserver
--    Using for python formatting
require "lspconfig".efm.setup {
    init_options = {documentFormatting = true},
		filetypes = {"python","lua","json"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {formatCommand = "lua-format -i", formatStdin = true}
            },
						--python = {
						--		{formatCommand = "black --quiet -", formatStdin = true}
						--},
						json = {
								{formatCommand = "jq", formatStdin = true}
						},
        }
    }
}
--[[
-- To get builtin LSP running, do something like:
-- NOTE: This replaces the calls where you would have before done `require('nvim_lsp').sumneko_lua.setup()`
--require('nlua.lsp.nvim').setup(require('lspconfig'), {
--  on_attach = custom_nvim_lspconfig_attach,
--
--  -- Include globals you want to tell the LSP are real :)
----  globals = {
----    -- Colorbuddy
----    "Color", "c", "Group", "g", "s",
----  }
--})
--]]
require'compe'.setup({
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    --vsnip = true;
  };
})

require'colorizer'.setup()
