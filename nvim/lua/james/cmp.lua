local cmp = require 'cmp'

cmp.setup {
	mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true
		}),
  },
	sources = {
		{
			name = 'nvim_lua'
		},
		{
			name = 'nvim_lsp'
		},
		{
			name = 'path'
		},
		{
			name = 'luasnip'
		},
		{
			name = 'buffer'
		},
	},
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
				luasnip = "[snip]",
        path = "[path]",
        luasnip = "[snip]",
      },
    },
  },
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
  experimental = {
    -- I like the new menu better! Nice work hrsh7th
    native_menu = false,
  },
}
