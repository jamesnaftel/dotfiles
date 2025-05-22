return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    -- "nvim-lua/plenary.nvim",
    "github/copilot.vim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
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
