vim.lsp.config('rust_analyzer', {
  name = 'rust',
  cmd = { 'rust-analyzer' },
  filetype = { 'rust'},
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
})
