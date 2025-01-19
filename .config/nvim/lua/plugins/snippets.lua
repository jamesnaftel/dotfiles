return {
  "rafamadriz/friendly-snippets",
  config = function()
    local friendly = require("luasnip.loaders.from_vscode")
    friendly.lazy_load()
  end,
}
