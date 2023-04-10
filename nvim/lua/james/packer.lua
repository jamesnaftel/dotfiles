-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'folke/tokyonight.nvim'

    -- Treesitter setup
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use "nvim-treesitter/playground"

    -- Telescop setup
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'kyazdani42/nvim-web-devicons'

    use 'neovim/nvim-lspconfig'

    -- Misc
    use 'nvim-lualine/lualine.nvim'
    use 'benmills/vimux'
    use 'numToStr/Comment.nvim'
    use 'chentoast/marks.nvim'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'simrat39/rust-tools.nvim'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'norcalli/nvim-colorizer.lua'
    use 'glepnir/lspsaga.nvim'

    -- ChatGPT
    use({
        "jackMort/ChatGPT.nvim",
            config = function()
                require("chatgpt").setup({
                    keymaps = {
                        submit = "<C-t>"
                    }
                })
            end,
            requires = {
              "MunifTanjim/nui.nvim",
              "nvim-lua/plenary.nvim",
              "nvim-telescope/telescope.nvim"
            }
    })

    -- Github Copilot
    use {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      after = "nvim-lspconfig",
      config = function()
        print()
        require("copilot").setup({
          panel = {
              enabled = false,
              keymap = {
                  accept = "<CR>",
                  refresh = "<leader> gr"
              },
              layout = {
                  position = "bottom",
                  ratio = 0.4,
              }
          },
          suggestions = { enabled = false, }
        })
      end,
    }


    -- Completion
    use "onsails/lspkind-nvim"
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp-document-symbol'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'
    use {
      "zbirenbaum/copilot-cmp",
      after = { "copilot.lua" },
      config = function ()
        require("copilot_cmp").setup()
      end
    }

    -- Markdown
    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    }

end)
