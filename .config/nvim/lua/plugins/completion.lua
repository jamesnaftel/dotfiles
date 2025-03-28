return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    event = "InsertEnter",
    dependencies = {
      "onsails/lspkind.nvim",
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup({
            method = "getCompletionsCycling", -- Ensure Copilot works inside cmp
            force_auto_complete = false,      -- ✅ Prevent Copilot from overriding inline completions
          })
        end
      },
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      vim.opt.shortmess:append "c"

      local lspkind = require("lspkind")

      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        sources = {
          -- group_index will hide copilot from source list
          { name = "copilot" }, --, group_index = 2 },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "buffer" },
        },
        mapping = {
          ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-y>"] = cmp.mapping(
            cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Insert,
              select = true,
            },
            { "i", "c" }
          ),
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text',
          })
        },
      })
    end,
  },
}
