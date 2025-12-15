#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=(
        $(
            fd --max-depth 1 --type d . \
                ~/dev \
                ~/git \
                ~/git/roblox \
                ~/git/roblox/utils \
                ~/git/roblox/misc \
                ~/git/misc \
                ~/frk \
                ~/frk/go \
                ~/frk/nvim-plugins \
                ~/misc \
                2>/dev/null
        )
        $(fd --type d --min-depth 2 --max-depth 2 . ~/git/roblox/ge-worktrees 2>/dev/null)
        $(fd --type d --min-depth 2 --max-depth 2 . ~/git/roblox/sp-worktrees 2>/dev/null)
        "$HOME/.config"
        "$HOME/.config/nvim"
        "$HOME/dotfiles"
    )
    selected=$(printf '%s\n' "${selected[@]}" | fzf)
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
