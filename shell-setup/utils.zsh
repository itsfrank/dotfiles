autoload -Uz colors && colors

# Print text in a named zsh color, e.g. color green "installed".
color() {
    local color_name=$1
    shift || return 2

    if [[ -z ${fg[$color_name]-} ]]; then
        print -u2 -r -- "unknown color: $color_name"
        return 2
    fi

    print -r -- "${fg[$color_name]}$*${reset_color}"
}

# Append a marker-delimited block to a file only when it is not present.
# Usage: ensure_block "marker text" /path/to/block /path/to/destination
ensure_block() {
    local marker_text=$1
    local block_file=$2
    local destination=$3
    local start_marker="# >>> $marker_text >>>"
    local end_marker="# <<< $marker_text <<<"

    if [[ -z $marker_text || -z $block_file || -z $destination ]]; then
        print -u2 -r -- 'usage: ensure_block "marker text" block-file destination'
        return 2
    fi

    if [[ ! -r $block_file ]]; then
        print -u2 -r -- "block file is not readable: $block_file"
        return 2
    fi

    if [[ -e $destination ]] && grep -Fqx -- "$start_marker" "$destination"; then
        return
    fi

    [[ -e $destination ]] || : > "$destination"
    print -r -- '' >> "$destination"
    print -r -- "$start_marker" >> "$destination"
    cat -- "$block_file" >> "$destination"
    print -r -- '' >> "$destination"
    print -r -- "$end_marker" >> "$destination"
}
