return {
  {
    'neovim-treesitter/nvim-treesitter',
    dependencies = { 'neovim-treesitter/treesitter-parser-registry' },
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install({
        'bash', 'c', 'diff', 'html', 'lua',
        'luadoc', 'markdown', 'markdown_inline',
        'query', 'vim', 'vimdoc', 'go', 'python',
        'rust', 'terraform', 'javascript', 'tsx',
        'json', 'cpp', 'dockerfile', 'yaml', 'zig',
      })

      -- Highlighting is no longer automatic in the new API
      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          local ok = pcall(vim.treesitter.start)
          if ok then
            vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            vim.wo.foldmethod = 'expr'
          end
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    enabled = false,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
  }
}
