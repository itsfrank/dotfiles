# Add color in manpages for less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# alias basic commands for better experience
alias mv="mv -iv"       # tell me what happened, warn about overwrites
alias cp="cp -riv"      # tell me what happened, warn about overwrites
alias mkdir="mkdir -vp" # tell me what happened, create nested dirs
alias ls="eza"
alias ll="eza -la"
alias vi='nvim'

# utils to reload nix configs
alias switch-nix="darwin-rebuild switch --flake ~/dotfiles/nix#frk"
alias switch-home="home-manager switch --flake ~/dotfiles/home#frk"
# reload configs when not using nix
alias switch-sh="$HOME/dotfiles/shell-setup/switch-sh"

# path
export PATH=$PATH:$DOTDIR/frk/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin #if bob-nvim is managing nvim versions
export PATH=$PATH:$HOME/go/bin
export PATH=/opt/homebrew/opt/llvm/bin:$PATH # for c++ debugging
export PATH=$HOME/.cargo/bin:$PATH # for c++ debugging
