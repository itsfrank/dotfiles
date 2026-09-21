# my tmux helper
tmx() {
    "$XDG_CONFIG_HOME"/tmux/scripts/tmx.sh "$@"
}

tms() {
    "$XDG_CONFIG_HOME"/tmux/scripts/tms.sh "$@"
}

tmux-init-sessions() {
    "$XDG_CONFIG_HOME"/tmux/scripts/tmux-init-sessions.sh "$@"
}

alias tmi="tmux-init-sessions"
