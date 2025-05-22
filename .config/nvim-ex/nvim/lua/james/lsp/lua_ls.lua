-- Register the Lua LSP config
vim.lsp.config("lua_ls", {
  name = "lua_ls",
  cmd = { "lua-language-server" },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT", },
      diagnostics = { globals = { "vim" } },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/luv/library",
        },
      },
      telemetry = { enable = false },
    },
  },
  on_attach = function(client, bufnr)
    print("Lua LS attached to buffer " .. bufnr)
  end,
})
