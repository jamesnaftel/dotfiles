map <Leader>rs :call VimuxRunCommand("clear; " . fnamemodify(bufname(1), ':p'))<CR>
map <Leader>vmd :call VimuxRunCommand("clear; asciidoctor " . expand("%:p") . "; open " . expand("%:p:r") . ".html")<CR>
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vz :VimuxZoomRunner<CR>

