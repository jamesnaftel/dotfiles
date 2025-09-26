return {
  "olimorris/codecompanion.nvim",
  enabled = true,
  dependencies = {
    -- "nvim-lua/plenary.nvim",
    "zbirenbaum/copilot.lua",
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
      chat = {
        adapter = "copilot",
      },
      inline = {
        adapter = "copilot",
      },
    },
    opts = {
      -- Set debug logging
      log_level = "DEBUG",
    },
  },
}
