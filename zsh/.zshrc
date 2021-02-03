export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git gitfast kubectl zsh_reload history-substring-search docker vi-mode)

source $ZSH/oh-my-zsh.sh

source $HOME/.config/zsh/functions
source $HOME/.config/zsh/exports
source $HOME/.config/zsh/path
source $HOME/.config/zsh/colors
source $HOME/.config/zsh/aliases
source $HOME/.config/zsh/prompts

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

bindkey '^A' history-substring-search-up
bindkey '^B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if hash pyenv 2>/dev/null; then
    # Python environment setup
    eval "$(pyenv init -)"
fi

if hash jenv 2>/dev/null; then
    # Java environment setup
    eval "$(jenv init -)"
    jenv enable-plugin export
    jenv enable-plugin maven
fi

if hash rbenv 2>/dev/null; then
    # Ruby environment setup
    eval "$(rbenv init -)"
fi

# Make sure /usr/local/bin is first in the path list
PATH="/usr/local/bin:$PATH"

RPROMPT='[%D{%L:%M:%S %p}]'
TMOUT=1
TRAPALRM() {
    zle reset-prompt
}
