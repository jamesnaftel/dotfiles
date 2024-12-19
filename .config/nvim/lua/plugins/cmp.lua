return {
  'hrsh7th/nvim-cmp',
  enabled = false,
  lazy = false,
  priority = 100,
  dependencies = {
    'onsails/lspkind.nvim',
    {
      'L3MON4D3/LuaSnip',
      version = "v2.*",
      build = "make install_jsregexp",
      dependencies = {},
    },
    'saadparwaiz1/cmp_luasnip',

    -- Adds other completion capabilities.
    --  nvim-cmp does not ship with all sources by default. They are split
    --  into multiple repos for maintenance purposes.
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',

  },
  config = function()
    local lspkind = require("lspkind")
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    luasnip.config.setup {}

    cmp.setup {
      completion = { completeopt = 'menu,menuone,noinsert' },
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = lspkind.cmp_format(),
        expandable_indicator = true,
      },

      mapping = {
        ["<C-y>"] = cmp.mapping(
          cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          },
          { "i", "c" }
        ),
        ["<C-l>"] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { "i", "s" }),
      },
      sources = {
        { name = 'lazydev', group_index = 0, },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
      },
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
    }
  end,
}
