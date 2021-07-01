""" autocmds """

" Rust
autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require('lsp_extensions.inlay_hints').request{
			\ aligned = true, prefix = " » ",
			\ enabled = {"TypeHint", "ChainingHint", "ParameterHint"}}
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)

" Go
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync()
autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" Java
autocmd BufWritePre *.java lua vim.lsp.buf.formatting_sync()
autocmd BufNewFile,BufRead *.java setlocal noet ts=4 sw=4 sts=4

" Ruby
"autocmd BufWritePre *.rb lua vim.lsp.buf.formatting_sync()
autocmd BufNewFile,BufRead *.rb setlocal expandtab ts=2 sw=2

" Python
autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab

" Markdown
autocmd BufNewFile,BufRead *.md setlocal ts=4 sw=4 sts=4 expandtab spell

" Terraform
autocmd BufRead,BufNewFile *.hcl,*.tf,*.tfvars set filetype=terraform
autocmd BufNewFile,BufRead,BufWritePost *.hcl,*.tf,*.tfvars TerraformFmt

" Misc spacing set up
autocmd BufNewFile,BufRead *.vim setlocal noet ts=4 sw=4 sts=4
autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
autocmd BufNewFile,BufRead *.yml,*.yaml setlocal expandtab ts=2 sw=2
autocmd BufNewFile,BufRead *.cpp,*.c setlocal expandtab ts=2 sw=2
autocmd BufNewFile,BufRead *.hpp setlocal expandtab ts=2 sw=2
autocmd BufNewFile,BufRead *.json setlocal expandtab ts=2 sw=2
autocmd BufNewFile,BufRead *.sh setlocal expandtab ts=2 sw=2
autocmd BufNewFile,BufRead *.rkt setlocal expandtab ts=2 sw=2
autocmd BufNewFile,BufRead *.scala setlocal shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.lua setlocal noet ts=2 sw=2 sts=2

" Dockerfile settings
autocmd FileType dockerfile set noexpandtab

" js settings TODO: fix
autocmd BufNewFile,BufRead *.js setlocal tabstop=4 softtabstop=8
autocmd BufNewFile,BufRead *.js setlocal expandtab ts=2 sw=2
autocmd FileType javascript syntax clear jsFuncBlock jsFuncArgs

" shell/config/systemd settings
autocmd FileType fstab,systemd set noexpandtab

" Odd ones ...
augroup filetypedetect
  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setfiletype tmux
  autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setfiletype nginx
augroup END

autocmd FocusLost * :wa
autocmd FileType help wincmd L

" Jump to valid line
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \	exe "normal! g`\"" |
      \ endif

autocmd FileType xml let b:dispatch = 'mvn compile'
