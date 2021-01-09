
au BufNewFile,BufRead *.vim setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
au BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
au BufNewFile,BufRead *.yml,*.yaml setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.cpp,*.c setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.hpp setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.json setlocal expandtab ts=2 sw=2

augroup filetypedetect
  au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  au BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
augroup END

au FileType nginx setlocal noet ts=4 sw=4 sts=4

" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" scala settings
autocmd BufNewFile,BufReadPost *.scala setl shiftwidth=2 expandtab

" Markdown Settings
autocmd BufNewFile,BufReadPost *.md setl ts=4 sw=4 sts=4 expandtab

" lua settings
autocmd BufNewFile,BufRead *.lua setlocal noet ts=2 sw=2 sts=2

" Dockerfile settings
autocmd FileType dockerfile set noexpandtab

" java settings
"autocmd FileType java set noexpandtab
"au BufNewFile,BufRead *.java setlocal noexpandtab tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.java setlocal noet ts=4 sw=4 sts=4

" js settings TODO: fix
au BufNewFile,BufRead *.js setlocal tabstop=4 softtabstop=8
au BufNewFile,BufRead *.js setlocal expandtab ts=2 sw=2
autocmd FileType javascript syntax clear jsFuncBlock jsFuncArgs

" shell/config/systemd settings
autocmd FileType fstab,systemd set noexpandtab
autocmd FileType gitconfig,sh,toml set noexpandtab

" python indent
autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab

" toml settings
au BufRead,BufNewFile MAINTAINERS set ft=toml
