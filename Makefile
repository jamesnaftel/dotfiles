zdotfiles:
	ln -sfn "$(PWD)"/.zsh/ $(HOME)/.zsh

install-tpm:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	# prefix + I to fetch plugins

