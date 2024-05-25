# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

PROMPT_EOL_MARK=''

# If you come from bash you might have to change your $PATH.
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:$HOME/.local/bin"
export FLYCTL_INSTALL="/home/my/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export VISUAL=nvim
export EDITOR="$VISUAL"
export GROFF_NO_SGR=1


ZVM_VI_INSERT_ESCAPE_BINDKEY=kj
ZVM_VI_EDITOR="$EDITOR"

function init() {
    bindkey '^ ' autosuggest-accept
    bindkey '\eOA' history-beginning-search-backward-end
    bindkey '\e[A' history-beginning-search-backward-end
    bindkey '^k' history-beginning-search-backward-end
    bindkey '\eOB' history-beginning-search-forward-end
    bindkey '\e[B' history-beginning-search-forward-end
    bindkey '^j' history-beginning-search-forward-end
}
zvm_after_init_commands+=(init)

function zvm_after_lazy_keybindings() {
  bindkey -M vicmd 'L' end-of-line
  bindkey -M vicmd 'H' beginning-of-line
  bindkey -M vicmd 'dd' kill-whole-line
}

ZVM_VI_HIGHLIGHT_BACKGROUND=#A6ADC8
ZVM_VI_HIGHLIGHT_FOREGROUND=#1E1E2E
ZVM_VI_HIGHLIGHT_EXTRASTYLE=bold

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

# ZSH_THEME="random"

# Plugins
plugins=(
        zsh-vi-mode
		zsh-autosuggestions
		zsh-syntax-highlighting
        colored-man-pages
		command-not-found
		colorize
		common-aliases
		)

source $ZSH/oh-my-zsh.sh

ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM
ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# Keybinds
bindkey "^H" backward-kill-word
bindkey '^ ' autosuggest-accept

alias la="ls -A"
alias ll="ls -al"
alias vim="nvim"
alias icat="kitty +kitten icat"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/home/my/.bun/_bun" ] && source "/home/my/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[ -f "/home/my/.ghcup/env" ] && source "/home/my/.ghcup/env" # ghcup-env

export PNPM_HOME="/home/my/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH=$PATH:/home/yum/.spicetify
