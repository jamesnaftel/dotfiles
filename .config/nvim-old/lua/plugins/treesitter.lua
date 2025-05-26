return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua',
        'luadoc', 'markdown', 'markdown_inline',
        'query', 'vim', 'vimdoc', 'go', 'python',
        'rust', 'terraform', 'javascript', 'tsx',
        'json', 'cpp', 'dockerfile', 'zig'
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
      },
    },
    config = function()
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require 'nvim-treesitter.configs'.setup({
        highlight = {
          enable = true, -- Enables syntax highlighting
        },
        -- Add this section for text objects
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to text objects
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
        },
      })
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
