export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git gitfast kubectl history-substring-search docker vi-mode)

source $ZSH/oh-my-zsh.sh

eval "$(direnv hook zsh)"

source $HOME/.config/zsh/functions
source $HOME/.config/zsh/exports
source $HOME/.config/zsh/path
source $HOME/.config/zsh/colors
source $HOME/.config/zsh/aliases
source $HOME/.config/zsh/prompts

FX_FUNCTIONS=$HOME/.config/zsh/fx_functions
if [[ -f "$FX_FUNCTIONS" ]]; then
    source "$FX_FUNCTIONS"
fi

FX_ALIASES=$HOME/.config/zsh/fx_aliases
if [[ -f "$FX_ALIASES" ]]; then
    source "$FX_ALIASES"
fi

FX_EXPORTS=$HOME/.config/zsh/fx_exports
if [[ -f "$FX_EXPORTS" ]]; then
    source "$FX_EXPORTS"
fi

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

bindkey '^A' history-substring-search-up
bindkey '^B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Make sure /usr/local/bin is first in the path list
# export PATH="/usr/local/bin:$PATH"

# Python environment setup
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"


# GoLang
export GOROOT=/Users/jamesnaftel/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=/Users/jamesnaftel/dev/go
export PATH=$GOPATH/bin:$PATH
