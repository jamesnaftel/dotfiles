return {
  "olimorris/codecompanion.nvim",
  enabled = false,
  dependencies = {
    -- "nvim-lua/plenary.nvim",
    "zbirenbaum/copilot.vim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    display = {
      action_palette = {
        -- force Telescope for the action-palette picker
        provider = "snacks",
        -- opts = {
        --   width  = .40,
        --   height = .20,
        --   prompt = "CC ❯ ",
        -- },
      },
    },
    strategies = {
      -- Change the default chat adapter
      chat = {
        adapter = "copilot",
      },
    },
    opts = {
      -- Set debug logging
      log_level = "DEBUG",
    },
  },
}
