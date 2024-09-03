local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '1gD', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gR', '<cmd>Lspsaga rename<cr>', bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>de', '<cmd>Lspsaga show_line_diagnostic<CR>', bufopts)
    vim.keymap.set('n', '<space>dp', '<cmd>Lspsaga diagnostic_jump_prev<CR>', bufopts)
    vim.keymap.set('n', '<space>dn', '<cmd>Lspsaga diagnostic_jump_next<CR>', bufopts)
    vim.keymap.set('n', '<space>dl', vim.diagnostic.setloclist, bufopts)
    vim.keymap.set('n', '<space>do', '<cmd>Lspsaga lsp_finder<cr>', bufopts)
    vim.keymap.set('n', '<space>dh', '<cmd>Lspsaga peek_definition<cr>', bufopts)
    vim.keymap.set('n', '<space>ff',function() vim.lsp.buf.format { async = true } end, bufopts)
end

--local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- nvim_lsp.sumneko_lua.setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { 'vim' }
--             },
--             workspace = {
--                 library = vim.api.nvim_get_runtime_file("", true)
--             }
--         }
--     }
-- })


nvim_lsp.gopls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

nvim_lsp.pyright.setup({
-- nvim_lsp.jedi_language_server.setup({
-- nvim_lsp.pylsp.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = nvim_lsp.util.root_pattern('.git'),
    -- settings = {
    --     python = {
    --         analysis = {
    --             autoSearchPaths = true,
    --             useLibraryCodeForTypes = true,
    --             diagnosticMode = "openFilesOnly",
    --         },
    --     },
    -- },
})

require("rust-tools").setup({
	tools = {
        inlay_hints = {
            auto = true,
            only_current_line = true,
        },
	},
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = {
			"rust-analyzer",
		},
		settings = {
			["rust-analyzer"] = {
				diagnostics = {
					experimental = true,
				},
                checkOnSave = {
                    command = "clippy"
                },
                lens = {
                    enable = true,
                },
			},
		},
	},
})

require'lspconfig'.clangd.setup{}

require'lspconfig'.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require'lspconfig'.terraformls.setup{}
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
    vim.lsp.buf.format()
  end,
})
