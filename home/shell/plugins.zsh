# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d "$ZINIT_HOME" ] && mkdir -p "${ZINIT_HOME:h}"
[ ! -d "$ZINIT_HOME/.git" ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "$ZINIT_HOME/zinit.zsh"

zinit ice depth=1
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions

if (( $+commands[deja] )); then
    export DEJA_CYCLE_KEY='^N'
    zinit ice wait"0" lucid depth=1
    zinit light Giammarco-Ferranti/deja
else
    print -u2 -r -- "deja not installed, falling back to zsh-autosuggestions"
    zinit light zsh-users/zsh-autosuggestions
fi

zinit light Aloxaf/fzf-tab
zinit snippet OMZP::git

autoload -Uz compinit && compinit
zinit cdreplay -q
