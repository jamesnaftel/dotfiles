autocmd BufRead,BufNewFile *.hcl set filetype=terraform
autocmd BufNewFile,BufRead *.hcl call terraform#fmt()
