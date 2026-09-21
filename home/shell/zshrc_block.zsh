# entrypoint for my personal zsh config
# having this lets random tools append to this file without messing up my dotfile deploy
if [[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/shell/init.zsh" ]]; then
    source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/init.zsh"
else
    print -u2 -r -- $'\e[31mmy zshrc is missing: '"${XDG_CONFIG_HOME:-$HOME/.config}/shell/init.zsh"$'\e[0m'
fi
