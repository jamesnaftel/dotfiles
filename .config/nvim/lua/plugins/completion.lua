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
    },
    version = 'v0.*',
    opts = {
      completion = {
        menu = {
          auto_show = true,
        },
      },
      keymap = { preset = 'default' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      signature = { enabled = true },
    },
  },
}
