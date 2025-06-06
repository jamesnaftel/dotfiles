return {
  'tpope/vim-fugitive',
  config = function()
    vim.api.nvim_create_user_command("GdiffBottom", function(args)
      vim.cmd("belowright split")                       -- Open the split below
      vim.cmd("resize " .. math.floor(vim.o.lines / 3)) -- Resize to 1/3 height
      vim.cmd("Gvdiffsplit " .. (args.args ~= "" and args.args or "HEAD"))
    end, { nargs = "?" })
  end,
  keys = {
    { "<leader>gb", ":GdiffBottom HEAD<CR>",    desc = "Git Diff Bottom 1/3", noremap = true, silent = true },
    { "<leader>gv", ":Gvdiffsplit HEAD<CR>",    desc = "Git Diff Bottom 1/3", noremap = true, silent = true },
    { "<leader>gc", ":diffoff! | only | e<CR>", desc = "Close Diff",          noremap = true, silent = true },
  }
}

