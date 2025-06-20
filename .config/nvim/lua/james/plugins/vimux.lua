return {
  'preservim/vimux',
  enabled = true,
  config = function()
    vim.keymap.set("n", "<Leader>vp", ":VimuxPromptCommand<CR>")
    vim.keymap.set("n", "<Leader>vl", ":VimuxRunLastCommand<CR>")
    vim.keymap.set("n", "<Leader>vi", ":VimuxInspectRunner<CR>")
    vim.keymap.set("n", "<Leader>vz", ":VimuxZoomRunner<CR>")
  end,
}
