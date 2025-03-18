return {
  'zbirenbaum/copilot.lua',
  dependencies = { 'zbirenbaum/copilot-cmp' },
  config = function()
    require('copilot').setup({
      panel = { enabled = false },
      suggestion = {
        enabled = true,      -- ✅ Enable inline suggestions
        auto_trigger = true, -- ✅ Automatically trigger suggestions
        debounce = 75,
      },
      filetypes = { markdown = true, help = true }
    })
    require("copilot_cmp").setup()
  end
}
