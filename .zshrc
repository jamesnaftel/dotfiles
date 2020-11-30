export ZSH="/Users/jamesnaftel/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git gitfast kubectl zsh_reload history-substring-search docker vi-mode)

source $ZSH/oh-my-zsh.sh

source $HOME/.zsh/functions
source $HOME/.zsh/exports
source $HOME/.zsh/path
source $HOME/.zsh/colors
source $HOME/.zsh/aliases
source $HOME/.zsh/prompts

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

bindkey '^A' history-substring-search-up
bindkey '^B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Python environment setup
eval "$(pyenv init -)"

# Java environment setup
eval "$(jenv init -)"
jenv enable-plugin export
jenv enable-plugin maven
