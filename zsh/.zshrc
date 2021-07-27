export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git gitfast kubectl zsh_reload history-substring-search docker vi-mode)

source $ZSH/oh-my-zsh.sh

eval "$(direnv hook zsh)"

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

# Python environment setup
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jamesnaftel/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jamesnaftel/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jamesnaftel/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jamesnaftel/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

