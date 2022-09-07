local status, cmp = pcall(require, "cmp")
if (not status) then return end

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
    }),
    formatting = {
        format = require('lspkind').cmp_format {
            with_text = true,
            menu = {
                nvim_lua = "[Lua]",
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                path = "[Path]",
                buffer = "[Buffer]",
            },
        },
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

-- vim.cmd [[
--   set completeopt=menuone,noinsert,noselect
--   highlight! default link CmpItemKind CmpItemMenuDefault
-- ]]
--
