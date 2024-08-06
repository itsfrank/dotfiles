# search for exe name recursively, if one founf exec, if many fzf then exec
# usage: exef <name> <path>
exef() {
    local exe_name="$1"
    local target_path="${2:-$(pwd)}"
    local selected_dir

    # Check if the provided path is a directory
    if [[ ! -d "$target_path" ]]; then
        echo "Error: $target_path is not a directory"
        return 1
    fi

    exe_list="$(fd -t x "$exe_name" "$target_path")"
    exe_count=$(echo "$exe_list" | wc -l)

    selected_exe="$exe_list"

    if [ "$exe_count" -lt "1" ]; then
        echo "no executables matching name '$exe_name' found"
        return 1
    fi

    if [ "$exe_count" -gt "1" ]; then
        selected_exe=$(echo "$exe_list" | fzf)
    fi

    $($selected_exe)
}
