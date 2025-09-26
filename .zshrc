ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

zinit snippet OMZP::git
zinit snippet OMZP::vi-mode

zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab


autoload -Uz compinit && compinit
zinit cdreplay -q

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

ZSH_THEME="moonfly"

source $HOME/.config/zsh/functions
source $HOME/.config/zsh/exports
source $HOME/.config/zsh/path
source $HOME/.config/zsh/aliases

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git --exclude .github"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git --exclude .github"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git --exclude .github . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git --exclude .github . "$1"
}

export GOROOT=/usr/local/go
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/dev/go
export PATH=$GOPATH/bin:$PATH

export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/config
export OLLAMA_API_BASE=http://localhost:11434

bindkey -v

source ~/lua51_env/bin/activate

source ~/.profile
