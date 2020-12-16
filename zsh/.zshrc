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

# Python environment setup
eval "$(pyenv init -)"

# Java environment setup
eval "$(jenv init -)"
jenv enable-plugin export
jenv enable-plugin maven
