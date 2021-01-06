
if g:os == "Darwin"
	" Set the python and ruby environment so I don't have to set it when I change the python version
	let g:python_host_prog = '$HOME/.pyenv/versions/2.7.18/bin/python'
	let g:python3_host_prog = '$HOME/.pyenv/versions/3.8.5/bin/python'
	let g:ruby_host_prog = '$HOME/.rbenv/versions/2.7.2/bin/neovim-ruby-host'
	let g:loaded_perl_provider = 0
elseif g:os == "Linux"
	let g:python3_host_prog = '/usr/bin/python3'
	let g:loaded_python_provider = 0
	let g:loaded_perl_provider = 0
	let g:loaded_node_provider = 0
endif
