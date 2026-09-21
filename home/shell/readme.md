# shell config

this dir gets copied to `~/.config/shell`.

i don't manage .zshrc directly, i just add a block that sources `init.zsh` (see
`zshrc_block.zsh`, and `../../shell-setup/manifest.zsh`)

- `init.zsh` loads the shell configuration in order.
- `env.zsh`, `options.zsh`, `aliases.zsh`, and `path.zsh` contain most config
- `plugins.zsh` configures Zinit and completion plugins
- fzf and tmux configs found in `~/.config/fzf/init.zsh` and `~/.config/tmux/init.zsh`.
