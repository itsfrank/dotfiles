alias vi="nvim"
alias vim="nvim"

#nvimd - fuzzy find directory and launch nvim
function nvimd {
    local target_path="${1:-$(pwd)}"
    local selected_dir

    # Check if the provided path is a directory
    if [[ ! -d "$target_path" ]]; then
        echo "Error: $target_path is not a directory"
        return 1
    fi

    selected_dir="$(fd --type d --hidden --follow --exclude .git --base-directory "$target_path" . | fzf --prompt 'Select directory: ')"

    if [[ -n "$selected_dir" ]]; then
        nvim "$target_path/$selected_dir" || return 1
    fi
}

# nvimf - fuzzy find file and launch nvim
function nvimf {
    local target_path="${1:-$(pwd)}"
    local selected_file

    # Check if the provided path is a directory
    if [[ ! -d "$target_path" ]]; then
        echo "Error: $target_path is not a directory"
        return 1
    fi

    selected_file="$(fd --type f --hidden --follow --exclude .git --base-directory "$target_path" . | fzf --prompt 'Select directory: ')"

    if [[ -n "$selected_file" ]]; then
        nvim "$target_path/$selected_file" || return 1
    fi
}
