return {
  {
    'saghen/blink.cmp',
    enabled = true,
    dependencies = {
      'rafamadriz/friendly-snippets',
      -- 'fang2hou/blink-copilot'
      -- 'giuxtaposition/blink-cmp-copilot',
    },

    version = '1.*',
    opts = {
      keymap = {
        ['<C-y>'] = { 'select_and_accept' },
        -- Accept completion on CR; when no item selected, let mini.pairs expand pairs
        ['<CR>'] = {
          'accept',
          function() return require('mini.pairs').cr() end,
          'fallback',
        },
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
        default = { 'lsp', 'path', 'snippets', 'buffer', }, -- 'copilot'
        providers = {
          -- copilot = {
          --   name = "copilot",
          --   -- module = "blink-copilot",
          --   module = "blink-cmp-copilot",
          --   score_offset = 100,
          --   async = true,
          -- },
        },
      },

      -- Disable cmdline completions to avoid unpack overflow with plugins like diffview
      cmdline = { sources = {} },

      signature = { enabled = true },

      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  }
}
