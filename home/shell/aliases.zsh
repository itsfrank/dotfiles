alias mv='mv -iv'
alias cp='cp -riv'
alias mkdir='mkdir -vp'
alias ls='eza'
alias ll='eza -la'
alias vi='nvim'
alias v='nvim'

alias aerospace-switch="aerospace list-windows --all | fzf | cut -d '|' -f 1 | xargs -I {} aerospace focus --window-id {}"
alias switch-sh="$HOME/dotfiles/shell-setup/switch-sh"
