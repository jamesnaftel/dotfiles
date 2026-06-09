return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    enabled = true,
    config = function()
      require('nvim-treesitter').install({
        'bash', 'c', 'diff', 'html', 'lua',
        'luadoc', 'markdown', 'markdown_inline',
        'query', 'vim', 'vimdoc', 'go', 'python',
        'rust', 'terraform', 'javascript', 'tsx',
        'json', 'cpp', 'dockerfile', 'yaml', 'zig',
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
