# Add color in manpages for less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# alias basic commands for better experience
alias mv="mv -iv" # tell me what happened, warn about overwrites
alias cp="cp -riv" # tell me what happened, warn about overwrites
alias mkdir="mkdir -vp" # tell me what happened, create nested dirs
alias ls="eza"
alias ll="eza -la"

export PATH=$PATH:$DOTDIR/frk/bin
