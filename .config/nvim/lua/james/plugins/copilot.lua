return {
    {
    "zbirenbaum/copilot.lua",
    enable = false,
    event = "InsertEnter",

    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        trigger_on_accept = true,
        keymap = {
          accept = "<leader>y",
        },
      },
      -- Disable the default panel
      panel = {
        enabled = false,
        auto_refresh = false,
      },
    },
    config = function(_, opts)
      require("copilot").setup(opts)
    end,
  }
}
