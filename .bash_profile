# bash_profile

# load generic environment
if [ -f ~/.load-config ]; then
    source ~/.load-config
fi

export PATH="/usr/local/bin:$PATH:/usr/local/opt/go/libexec/bin:/usr/local/go/bin"

# Remove this once the issue with the latest protobuf is resolved.
export PATH="/usr/local/opt/protobuf@3.7/bin:$PATH"

# fix ctrl-w in VIM
stty start undef stop undef
export PATH="/usr/local/sbin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

os=${OSTYPE//[0-9.]/}
if [ $os == "darwin" ]; then
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
	fi
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH=/usr/local/mysql/bin:$PATH

[ -s "/usr/local/opt/nvm/nvm.sh"  ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion"  ] && . "/usr/local/opt/nvm/etc/bash_completion"

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}
