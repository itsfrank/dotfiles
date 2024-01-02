cdf() {
    local target_path="${1:-$(pwd)}"
    local selected_dir

    # Check if the provided path is a directory
    if [[ ! -d "$target_path" ]]; then
        echo "Error: $target_path is not a directory"
        return 1
    fi

    selected_dir="$(fd --type d --hidden --follow --exclude .git --base-directory "$target_path" . | fzf --prompt 'Select directory: ')"

    if [[ -n "$selected_dir" ]]; then
        cd "$target_path/$selected_dir" || return 1
    fi
}
