dotfiles:
	# add symlink for dotfiles
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done; \

install-tpm:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	# prefix + I to fetch plugins
