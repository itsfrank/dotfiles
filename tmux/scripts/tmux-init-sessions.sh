#!/bin/bash

function make_session { # $1: name $2: dir
    local session_name=$1
    local session_dir=$2
    if tmux has-session -t "$session_name" 2>/dev/null; then
        return 1 # 1 == window already exists
    fi
    tmux new-session -d -s "$session_name" -c "$session_dir"
    return 0
}

scr_name="scratch"
if (make_session "$scr_name" "$HOME"); then
    echo "created session '$scr_name'"
fi

df_name="dotfiles"
if (make_session "$df_name" "$HOME/.config"); then
    tmux rename-window -t "$df_name:1" "nvim"
    tmux send-keys -t "$df_name:1" 'cd nvim' Enter
    tmux send-keys -t "$df_name:1" C-l
    tmux new-window -t "$df_name" -n "config"
    tmux select-window -t "$df_name:1"
    echo "created session '$df_name'"
fi
