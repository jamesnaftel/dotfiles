return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    enabled = true,
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua',
        'luadoc', 'markdown', 'markdown_inline',
        'query', 'vim', 'vimdoc', 'go', 'python',
        'rust', 'terraform', 'javascript', 'tsx',
        'json', 'cpp', 'dockerfile', 'yaml', 'zig'
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
      },
    },
    config = function(_, opts)
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(vim.tbl_deep_extend("force", opts, {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
        },
      }))
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    after = 'nvim-treesitter',
  }
}
