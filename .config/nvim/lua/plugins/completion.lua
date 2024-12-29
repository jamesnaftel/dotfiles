return {
  {
    'saghen/blink.compat',
    version = '*',
    lazy = true,
    opts = {
      debug = false,
    },
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'yetone/avante.nvim',
    },
    version = 'v0.*',
    opts = {
      completion = { menu = { auto_show = true, }, },
      keymap = { preset = 'default' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      signature = { enabled = true },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'markdown', 'avante_commands', 'avante_mentions' },
        providers = {
          markdown = { name = 'RenderMarkdown', module = 'render-markdown.integ.blink' },
          avante_commands = {
            name = "avante_commands",
            module = "blink.compat.source",
            score_offset = 100,
          },
          avante_mentions = {
            name = "avante_mentions",
            module = "blink.compat.source",
            score_offset = 110,
          },
        },
      },
    },
  },
}
