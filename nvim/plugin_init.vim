if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

  " Snippets
  "Plug 'SirVer/ultisnips'

  " Go
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " Misc
  Plug 'mhinz/vim-sayonara'
  Plug 'itchyny/lightline.vim'
  Plug 'frazrepo/vim-rainbow'
"  Plug 'bronson/vim-trailing-whitespace'
"  Plug 'dylanaraps/wal.vim'
"  Plug 'francoiscabrol/ranger.vim'
"  Plug 'godlygeek/tabular'
"  Plug 'janko/vim-test'
"  Plug 'kshenoy/vim-signature'

  Plug 'justinmk/vim-dirvish'

  " Hail Tpope
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'

  " Neovim LSP Autocompletion, Diagnostic Stuff
  Plug 'neovim/nvim-lspconfig'
  Plug 'tjdevries/lsp_extensions.nvim'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-lua/diagnostic-nvim'
  Plug 'steelsojka/completion-buffers'
  Plug 'voldikss/vim-floaterm'

  " Sitting on the Top of a Tree
"  Plug 'nvim-treesitter/completion-treesitter'
"  Plug 'nvim-treesitter/nvim-treesitter'

  " Tele Pack
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/telescope.nvim'

  " Colors and Whatnot
  Plug 'chriskempson/base16-vim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }


  " Terraform
  Plug 'hashivim/vim-terraform'
  Plug 'hashicorp/terraform-ls'
call plug#end()
