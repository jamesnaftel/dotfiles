# ==============================================================================
# 1. PLUGIN MANAGER (ZINIT)
# ==============================================================================
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

# ==============================================================================
# 2. SHELL OPTIONS & HISTORY
# ==============================================================================
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups
setopt hist_save_no_dups hist_ignore_dups hist_find_no_dups

# ==============================================================================
# 3. COMPLETION & FZF SETTINGS
# ==============================================================================
autoload -Uz compinit && compinit
zinit cdreplay -q

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# FZF modern init (Replaces old source ~/.fzf.zsh)
if (( $+commands[fzf] )); then
  source <(fzf --zsh)
fi

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git --exclude .github"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git --exclude .github"

# ==============================================================================
# 4. KEYBINDINGS (The "Moonlander" Home Row)
# ==============================================================================
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# Accept Zsh-Autosuggestion with Ctrl-E
# This completes the "ghost text" you see while typing
bindkey '^E' autosuggest-accept

# Fuzzy History Search with Ctrl-R
bindkey '^R' fzf-history-widget

# Vi-mode substring search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# ==============================================================================
# 5. EXPORTS & SMART NAVIGATION
# ==============================================================================
export GOROOT=/usr/local/go
export GOPATH=$HOME/dev/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/config
export OLLAMA_API_BASE=http://localhost:11434

# Zoxide: teleport with 'z' (Rust powered)
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
fi

# Load modular configs
for file in functions exports path aliases; do
    [ -f "$HOME/.config/zsh/$file" ] && source "$HOME/.config/zsh/$file"
done

# Work/Tinkering specific
for file in fx_functions fx_aliases fx_exports; do
    [ -f "$HOME/.config/zsh/$file" ] && source "$HOME/.config/zsh/$file"
done

# ==============================================================================
# 6. STARSHIP TRANSIENT PROMPT
# ==============================================================================
function starship_transient_prompt_func() {
  starship module character
}
eval "$(starship init zsh)"

# ==============================================================================
# 7. FINAL
# ==============================================================================
[ -f ~/.profile ] && source ~/.profile

