return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = function()
    local autopairs = require("nvim-autopairs") -- import nvim-autopairs

    -- setup autopairs
    autopairs.setup({
      check_ts = true, -- treesitter enabled
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        java = false,
      },
    })
  end,
}
