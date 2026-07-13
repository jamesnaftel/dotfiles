return {
  {
    "echasnovski/mini.nvim",
    enabled = true,
    config = function()
      require("mini.ai").setup()
      require("mini.surround").setup()
      require("mini.pairs").setup()

      local md = require("mini.diff")
      md.setup({
        source = { md.gen_source.git(), md.gen_source.none() }, -- none() ensures set_ref_text always works
        view = {
          style = 'sign',
          signs = { add = '▎', change = '▎', delete = '▎' },
        },
      })

      -- Toggle inline overlay (shows deleted lines as virtual text, char-level highlights)
      vim.keymap.set('n', '<leader>go', function() require('mini.diff').toggle_overlay() end,
        { desc = 'MiniDiff: toggle inline overlay' })

      -- Change the diff base on the fly, e.g. 'HEAD~2', a branch name, any ref
      vim.keymap.set('n', '<leader>gB', function()
        local ref = vim.fn.input('Diff base (default HEAD): ')
        if ref == '' then ref = 'HEAD' end
        local abs  = vim.fn.expand('%:p')
        local root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
        local file = abs:sub(#root + 2) -- path relative to git root
        local text = vim.fn.systemlist('git show ' .. ref .. ':' .. file)
        if vim.v.shell_error ~= 0 then
          -- File didn't exist at that ref (new file) — diff against empty
          text = {}
        end
        local buf = vim.api.nvim_get_current_buf()
        require('mini.diff').set_ref_text(buf, text)
        vim.notify('mini.diff base → ' .. ref, vim.log.levels.INFO)
      end, { desc = 'MiniDiff: set git base ref' })
      require("mini.operators").setup()
    end,
  },
}
