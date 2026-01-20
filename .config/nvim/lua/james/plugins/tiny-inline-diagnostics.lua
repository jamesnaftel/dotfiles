return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    -- Disable built-in inline diagnostics so the plugin can render them
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = false,
      severity_sort = true,
    })

    local tiny = require("tiny-inline-diagnostic")

    tiny.setup({
      preset = "powerline",
      hi = {
        error = "DiagnosticError",
        warn = "DiagnosticWarn",
        info = "DiagnosticInfo",
        hint = "DiagnosticHint",
        arrow = "NonText",
        background = "CursorLine",
        mixing_color = "Normal",
      },
      options = {
        overflow = {
          mode = "wrap",
        },
        show_all_diags_on_cursorline = false,
        multilines = {
          enabled = true,
          always_show = true,
        },
        severity = {
          vim.diagnostic.severity.ERROR,
          vim.diagnostic.severity.WARN,
          vim.diagnostic.severity.INFO,
          vim.diagnostic.severity.HINT,
        },
      },
    })

    -- Ensure buffers with an already-attached client pick up diagnostics immediately
    for _, client in pairs(vim.lsp.get_clients()) do
      for buf in pairs(client.attached_buffers or {}) do
        if vim.api.nvim_buf_is_valid(buf) then
          vim.api.nvim_exec_autocmds("LspAttach", {
            buffer = buf,
            data = { client_id = client.id },
          })
        end
      end
    end
  end,
}
