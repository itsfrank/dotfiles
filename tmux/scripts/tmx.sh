#!/bin/bash

# given one line output from tmux list-sessions
function _get_session_name {
    local result=$(awk '{print substr($1, 1, length($1)-1)}' <<<"$1")
    echo "$result"
}

function _tmx {
    function _exec {
        local session=$(_get_session_name "$1")
        tmux kill-session -t $session
    }

    export -f _get_session_name
    export -f _exec
    local choice=$(
        tmux list-sessions | SHELL=/bin/bash fzf \
            --layout=reverse \
            --bind='ctrl-x:execute(_exec {})+reload(tmux list-sessions)' \
            --expect="ctrl-n" \
            --expect="ctrl-s" \
            --expect="ctrl-i" \
            --bind='tab:down,btab:up' \
            --header="ENTER switch, <c-x> kill, <c-n> new, <c-s> tms" --color=header:#719872
    )

    if [[ "$choice" == "" ]]; then
        return 0
    fi

    # check if new session requested
    local line1=$(echo "$choice" | head -n 1)
    if [[ "$line1" == "ctrl-n" ]]; then
        read -p "session name: " session_name || return 0
        if [ -z "${TMUX}" ]; then
            tmux new-session -s "$session_name"
        else
            tmux new-session -d -s "$session_name"
            tmux switch-client -t "$session_name"
        fi
        return 0
    elif [[ "$line1" == "ctrl-s" ]]; then
        ~/.config/tmux/scripts/tms.sh || return 0
        return 0
    fi

    local session=$(_get_session_name "$choice")
    if [ -z "${TMUX}" ]; then
        tmux attach-session -t $session
    else
        tmux switch-client -t $session
    fi
}
_tmx
