if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

  " Snippets
  Plug 'SirVer/ultisnips'

  " Misc
  Plug 'kshenoy/vim-signature'
  Plug 'mhinz/vim-sayonara'
  Plug 'itchyny/lightline.vim'
  Plug 'frazrepo/vim-rainbow'
  Plug 'janko/vim-test'
  Plug 'benmills/vimux'
  Plug 'justinmk/vim-dirvish'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'cespare/vim-toml'
  Plug 'numToStr/Comment.nvim'
  Plug 'kyazdani42/nvim-web-devicons'

  " Hail Tpope
  Plug 'tpope/vim-dispatch', {'do': 'make'}
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'

  " Neovim LSP Autocompletion, Diagnostic Stuff
  Plug 'tjdevries/nlua.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/lsp_extensions.nvim'
  Plug 'voldikss/vim-floaterm'

  " Completion
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-nvim-lua'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'onsails/lspkind-nvim'

  " Sitting on the Top of a Tree
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'

  " Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }


  " Colors and Whatnot
  Plug 'chriskempson/base16-vim'
  Plug 'norcalli/nvim-colorizer.lua'

  " Terraform
  Plug 'hashivim/vim-hashicorp-tools'
  Plug 'hashicorp/terraform-ls'

  " Plugin for learning
  Plug 'jamesnaftel/nvim-james-learn'

  " To look at
  " https://github.com/nvim-lua/lsp-status.nvim
  " https://github.com/ericpubu/lsp_codelens_extensions.nvim
call plug#end()
