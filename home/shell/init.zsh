# common zsh entrypoint
# essentially my .zshrc the real file can get mangled by various scripts
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
ZSH_CONFIG_DIR="${${(%):-%N}:A:h}"
source "$ZSH_CONFIG_DIR/env.zsh"

# set up tolling/package managers
if [[ $OSTYPE == darwin* ]] && [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if (( $+commands[mise] )); then
    eval "$(mise activate zsh)"
fi

# zsh config
source "$ZSH_CONFIG_DIR/plugins.zsh"
source "$ZSH_CONFIG_DIR/options.zsh"
source "$ZSH_CONFIG_DIR/aliases.zsh"
source "$ZSH_CONFIG_DIR/path.zsh"

[[ -r "$XDG_CONFIG_HOME/fzf/init.zsh" ]] && source "$XDG_CONFIG_HOME/fzf/init.zsh"
[[ -r "$XDG_CONFIG_HOME/tmux/init.zsh" ]] && source "$XDG_CONFIG_HOME/tmux/init.zsh"


# machine specific files
[[ -r "$HOME/.keysrc" ]] && source "$HOME/.keysrc"
[[ -r "$HOME/.localrc" ]] && source "$HOME/.localrc"

# integrations
if (( $+commands[fzf] )); then
    source <(fzf --zsh)
fi

if (( $+commands[thefuck] )); then
    eval "$(thefuck --alias)"
fi

if (( $+commands[starship] )); then
    eval "$(starship init zsh)"
fi

