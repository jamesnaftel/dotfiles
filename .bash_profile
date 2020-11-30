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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jamesnaftel/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jamesnaftel/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jamesnaftel/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jamesnaftel/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

