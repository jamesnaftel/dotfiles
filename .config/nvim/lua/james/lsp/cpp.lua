-- Ensure header files are detected as cpp filetype when appropriate
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.h', '*.hpp', '*.hxx', '*.hh' },
  callback = function()
    -- Check if we're in a C++ project context by looking for common C++ indicators
    local cpp_indicators = {
      'CMakeLists.txt',
      '*.cpp',
      '*.cxx', 
      '*.cc',
      '*.hpp',
      '*.hxx',
      'compile_commands.json'
    }
    
    local cwd = vim.fn.getcwd()
    for _, pattern in ipairs(cpp_indicators) do
      if vim.fn.glob(cwd .. '/' .. pattern) ~= '' then
        vim.bo.filetype = 'cpp'
        return
      end
    end
  end,
})

vim.lsp.config('clangd', {
  name = 'clangd',
  cmd = { 
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--completion-style=detailed',
    '--header-insertion=iwyu',
    '--suggest-missing-includes',
    '--cross-file-rename',
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
  single_file_support = true,
  root_markers = {
    'compile_commands.json',
    'compile_flags.txt',
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'CMakeLists.txt',
    'Makefile',
    'configure.ac',
    '.git',
  },
  settings = {
    clangd = {
      -- Enable completion snippets
      completion = {
        enableSnippets = true,
      },
      -- Enable inlay hints
      inlayHints = {
        enabled = true,
        parameterNames = true,
        deducedTypes = true,
        designators = true,
      },
      -- Semantic highlighting
      semanticHighlighting = true,
    },
  },
  on_attach = function(client, bufnr)
    -- Add C++ specific commands
    vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdSwitchSourceHeader', function()
      client:exec_cmd({
        command = 'clangd.switchSourceHeader',
        arguments = { vim.uri_from_bufnr(bufnr) },
      })
    end, {
      desc = 'Switch between source and header file',
    })

    vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdMemoryUsage', function()
      client:exec_cmd({
        command = 'clangd.memoryUsage',
      })
    end, {
      desc = 'Show clangd memory usage',
    })

    vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdAST', function()
      client:exec_cmd({
        command = 'clangd.ast',
        arguments = { vim.uri_from_bufnr(bufnr) },
      })
    end, {
      desc = 'Show AST for current file',
    })
  end,
})
