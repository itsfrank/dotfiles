# my tmux helper
tmx() {
    "$DOTDIR"/tmux/scripts/tmx.sh "$@"
}

tms() {
    "$DOTDIR"/tmux/scripts/tms.sh "$@"
}

tmux-init-sessions() {
    "$DOTDIR"/tmux/scripts/tmux-init-sessions.sh "$@"
}

alias tmi="tmux-init-sessions"
