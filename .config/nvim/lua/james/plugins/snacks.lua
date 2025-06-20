return {
  {
    "folke/snacks.nvim",
    enabled = true,
    priority = 1000,
    lazy = false,
    opts = {
      input = {
        enabled = true,
      },
      quickfile = {
        enabled = true,
      },
      picker = {
        enabled = true,
        matchers = {
          frecency = true,
          cwd_bonus = false,
        },
        formatters = {
          file = {
            filename_first = false,
            filename_only = false,
            icon_width = 2,
          },
        },
        layout = {
          -- presets options : "default" , "ivy" , "ivy-split" , "telescope" , "vscode", "select" , "sidebar"
          -- override picker layout in keymaps function as a param below
          preset = "telescope", -- defaults to this layout unless overidden
          cycle = false,
        },
        layouts = {
          select = {
            preview = false,
            layout = {
              backdrop = false,
              width = 0.6,
              min_width = 80,
              height = 0.4,
              min_height = 10,
              box = "vertical",
              border = "rounded",
              title = "{title}",
              title_pos = "center",
              { win = "input",   height = 1,          border = "bottom" },
              { win = "list",    border = "none" },
              { win = "preview", title = "{preview}", width = 0.6,      height = 0.4, border = "top" },
            }
          },
          telescope = {
            reverse = true, -- set to false for search bar to be on top
            layout = {
              box = "horizontal",
              backdrop = false,
              width = 0.8,
              height = 0.9,
              border = "none",
              {
                box = "vertical",
                { win = "list",  title = " Results ", title_pos = "center", border = "rounded" },
                { win = "input", height = 1,          border = "rounded",   title = "{title} {live} {flags}", title_pos = "center" },
              },
              {
                win = "preview",
                title = "{preview:Preview}",
                width = 0.50,
                border = "rounded",
                title_pos = "center",
              },
            },
          },
          ivy = {
            layout = {
              box = "vertical",
              backdrop = false,
              width = 0,
              height = 0.4,
              position = "bottom",
              border = "top",
              title = " {title} {live} {flags}",
              title_pos = "left",
              { win = "input", height = 1, border = "bottom" },
              {
                box = "horizontal",
                { win = "list",    border = "none" },
                { win = "preview", title = "{preview}", width = 0.5, border = "left" },
              },
            },
          },
        }
      },
    },
    keys = {
      { "<leader>dB",  function() require("snacks").bufdelete() end,                                      desc = "Delete or Close Buffer  (Confirm)" },

      { "<leader>tf",  function() require("snacks").picker.files() end,                                   desc = "Find Files (Snacks Picker)" },
      { "<leader>sg",  function() require("snacks").picker.grep() end,                                    desc = "Grep word" },
      { "<leader>ts",  function() require("snacks").picker.grep_word() end,                               desc = "Search Visual selection or Word",  mode = { "n", "x" } },
      { "<leader>pk",  function() require("snacks").picker.keymaps({ layout = "ivy" }) end,               desc = "Search Keymaps (Snacks Picker)" },
      { "<leader>sv",  function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },

      { "<leader>gbr", function() require("snacks").picker.git_branches({ layout = "select" }) end,       desc = "Pick and Switch Git Branches" },

      -- TODO: pick new keymap
      { "<leader>th",  function() require("snacks").picker.colorschemes({ layout = "ivy" }) end,          desc = "Pick Color Schemes" },
      { "<leader>vh",  function() require("snacks").picker.help() end,                                    desc = "Help Pages" },

      -- Scratch
      { "<leader>.",   function() require("snacks").scratch() end,                                        desc = "Toggle Scratch Buffer" },
      { "<leader>S",   function() require("snacks").scratch.select() end,                                 desc = "Select Scratch Buffer" },
    }
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "<leader>pt", function() require("snacks").picker.todo_comments() end,                                          desc = "Todo" },
      { "<leader>pT", function() require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
    },
  }
}
