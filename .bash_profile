# bash_profile

# load generic environment
if [ -f ~/.load-config ]; then
    source ~/.load-config
fi

# source work specific files (files stored in company github)
if [ -e ~/.sapaliases ]
then
	source ~/.sapaliases
fi

if [ -e ~/.sapfunctions ]
then
	source ~/.sapfunctions
fi

export PATH="/usr/local/bin:$PATH:/usr/local/opt/go/libexec/bin"

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
