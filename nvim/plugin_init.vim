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
  Plug 'mhinz/vim-sayonara'
  Plug 'itchyny/lightline.vim'
  Plug 'frazrepo/vim-rainbow'
  Plug 'dylanaraps/wal.vim'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'godlygeek/tabular'
  Plug 'janko/vim-test'
  Plug 'kshenoy/vim-signature'
  Plug 'benmills/vimux'
  Plug 'justinmk/vim-dirvish'
  Plug 'ntpeters/vim-better-whitespace'
"  Plug 'jiangmiao/auto-pairs'
  Plug 'cespare/vim-toml'
  "Plug 'tjdevries/nlua.nvim'

  " Hail Tpope
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'

  " Neovim LSP Autocompletion, Diagnostic Stuff
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  "Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-lua/lsp_extensions.nvim'
  "Plug 'steelsojka/completion-buffers'
  Plug 'voldikss/vim-floaterm'

  " Sitting on the Top of a Tree
  "Plug 'nvim-treesitter/completion-treesitter'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'

  " Tele Pack
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/telescope.nvim'

  " Colors and Whatnot
  Plug 'chriskempson/base16-vim'
  Plug 'norcalli/nvim-colorizer.lua'

  " Terraform
  Plug 'hashivim/vim-hashicorp-tools'
  Plug 'hashicorp/terraform-ls'

  " Plugin for learning
  Plug 'jamesnaftel/nvim-james-learn'
call plug#end()
