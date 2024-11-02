#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find \
        ~/git \
        ~/git/roblox \
        ~/git/roblox/utils \
        ~/git/roblox/misc \
        ~/git/misc \
        ~/frk \
        ~/frk/go \
        ~/frk/nvim-plugins \
        ~/misc \
        -mindepth 1 -maxdepth 1 -type d)
    selected+="\n"
    selected+=$(find ~/git/roblox/ge-worktrees -mindepth 2 -maxdepth 2 -type d)
    selected+="\n"
    selected+="$HOME/.config"
    selected=$(printf '%s' "$selected" | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
if ! tmux has-session -t="$selected_name" 2>/dev/null; then
    tmux new-session -ds "$selected_name" -c "$selected"
fi

if [[ -z $TMUX ]]; then
    tmux attach-session -t "$selected_name"
else
    tmux switch-client -t "$selected_name"
fi
