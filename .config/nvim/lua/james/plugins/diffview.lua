local function set_diff_hl()
  -- Line-level diff backgrounds (rich enough to read on transparent themes)
  vim.api.nvim_set_hl(0, 'DiffAdd',    { bg = '#2d4a3e' })
  vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#4a2424' })
  vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#2d3a4a' })
  -- Word-level highlights (used by enhanced_diff_hl)
  vim.api.nvim_set_hl(0, 'DiffText',   { bg = '#3d6e52', bold = true })
  -- Diffview-specific groups
  vim.api.nvim_set_hl(0, 'DiffviewDiffAddAsDelete', { bg = '#4a2424' })
  vim.api.nvim_set_hl(0, 'DiffviewDiffDelete',      { bg = '#4a2424', fg = '#6b3030' })
end

return {
  'sindrets/diffview.nvim',
  enabled = true,
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewFileHistory' },
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<CR>',          desc = 'Diffview: open working tree diff' },
    { '<leader>gh', '<cmd>DiffviewFileHistory %<CR>',  desc = 'Diffview: file history (current file)' },
    { '<leader>gH', '<cmd>DiffviewFileHistory<CR>',    desc = 'Diffview: file history (repo)' },
    { '<leader>gx', '<cmd>DiffviewClose<CR>',          desc = 'Diffview: close' },
  },
  config = function(_, opts)
    require('diffview').setup(opts)

    -- Apply immediately and re-apply after any colorscheme reload
    set_diff_hl()
    vim.api.nvim_create_autocmd('ColorScheme', {
      group = vim.api.nvim_create_augroup('diffview_hl', { clear = true }),
      callback = set_diff_hl,
    })
  end,
  opts = {
    enhanced_diff_hl = true,
    view = {
      default = {
        layout = 'diff2_horizontal',
      },
      merge_tool = {
        layout = 'diff3_horizontal',
        disable_diagnostics = true,
      },
    },
    file_panel = {
      listing_style = 'tree',
      win_config = { width = 35 },
    },
  },
}
