local nnoremap = require("james.keymap").nnoremap

-- Vimux
nnoremap("<Leader>vp", ":VimuxPromptCommand<CR>")
nnoremap("<Leader>vl", ":VimuxRunLastCommand<CR>")
nnoremap("<Leader>vi", ":VimuxInspectRunner<CR>")
nnoremap("<Leader>vz", ":VimuxZoomRunner<CR>")
