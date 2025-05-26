return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      -- 'fang2hou/blink-copilot'
      -- 'giuxtaposition/blink-cmp-copilot',
    },
    enabled = true,

    version = '1.*',
    opts = {
      keymap = {
        ['<C-y>'] = { 'select_and_accept' },
      },

      appearance = {
        nerd_font_variant = 'mono'
      },

      completion = {
        documentation = { auto_show = false },
        menu = {
          draw = {
            treesitter = { enabled = true },
          },
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer',  }, -- 'copilot'
        providers = {
          copilot = {
            name = "copilot",
            -- module = "blink-copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },

      signature = { enabled = true },

      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  }
}
