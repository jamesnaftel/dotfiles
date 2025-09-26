vim.lsp.config('gopls', {
  name = 'gopls',
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = {
    'go.work',
    'go.mod',
    '.git',
  },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
      completeUnimported = true,
      usePlaceholders = true,
      -- Enable navigation to standard library source
      symbolScope = "all",
      linkTarget = "pkg.go.dev",
      -- Better completion and matching
      deepCompletion = true,
      matcher = "fuzzy",
      -- Show function signatures in completion
      experimentalPostfixCompletions = true,
      -- Enable codelens
      codelenses = {
        gc_details = true,
        generate = true,
        regenerate_cgo = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
    },
  },
  on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Add Go specific commands
    vim.api.nvim_buf_create_user_command(bufnr, 'LspGoImports', function()
      client:exec_cmd({
        command = 'gopls.add_import',
        arguments = {
          {
            ImportPath = vim.fn.input('Import path: '),
          },
        },
      })
    end, {
      desc = 'Add Go import',
    })

    -- vim.api.nvim_buf_create_user_command(bufnr, 'LspGoOrganizeImports', function()
    --   local params = vim.lsp.util.make_range_params()
    --   params.context = { only = { 'source.organizeImports' } }
    --   local result = vim.lsp.buf_request_sync(bufnr, 'textDocument/codeAction', params, 1000)
    --   for _, res in pairs(result or {}) do
    --     for _, r in pairs(res.result or {}) do
    --       if r.edit then
    --         vim.lsp.util.apply_workspace_edit(r.edit, 'utf-8')
    --       end
    --     end
    --   end
    -- end, {
    --   desc = 'Organize Go imports',
    -- })
  end,
})




