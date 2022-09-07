local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local M = {}
M.format_open_float = function()
    vim.diagnostic.open_float({
        scope = "line",
        border = "double"
    })
end

local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '1gD', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gR', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>dp', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', '<space>dn', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', '<space>dl', vim.diagnostic.setloclist, bufopts)
    vim.keymap.set('n', '<space>do', M.format_open_float, bufopts)
    vim.keymap.set('n', '<space>dx', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', '<space>ff',function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

nvim_lsp.sumneko_lua.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            }
        }
    }
})

nvim_lsp.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})
