-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'
  use 'nvim-lualine/lualine.nvim'

  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Telescop setup
  use {
  	'nvim-telescope/telescope.nvim', tag = '0.1.0',
  	requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'kyazdani42/nvim-web-devicons'


  use 'marko-cerovac/material.nvim'

  use 'folke/tokyonight.nvim'

  use 'catppuccin/nvim'
end)
