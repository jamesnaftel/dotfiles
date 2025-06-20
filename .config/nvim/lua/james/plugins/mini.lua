return {
  {
    "echasnovski/mini.nvim",
    enabled = true,
    config = function()
      require("mini.ai").setup()
      require("mini.surround").setup()
      require("mini.pairs").setup()
      require("mini.operators").setup()
    end,
  },
}
