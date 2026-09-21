#shell
conf "./shell/" ".config/shell/"
block "dotfiles shell" "$homesrc_dir/shell/zshrc_block.zsh" ".zshrc"

#configs
# conf "./aerospace/" ".config/aerospace/"
conf "./fzf/" ".config/fzf/"
conf "./ghostty/" ".config/ghostty/"
conf "./gitui/" ".config/gitui/"
conf "./sketchybar/" ".config/sketchybar/"
conf "./starship.toml" ".config/starship.toml"
conf "./tmux/" ".config/tmux/"
conf "./wezterm/" ".config/wezterm/"
gen lute "run $homesrc_dir/karabiner/karabiner.luau" ".config/karabiner/karabiner.json"

# aerospace hack for gaps toggle
conf "./aerospace/aerospace-base.toml" ".config/aerospace/aerospace.toml"
conf "./aerospace/aerospace-base.toml" ".config/aerospace/aerospace-gaps.toml"
conf "./aerospace/switch-config.sh" ".config/aerospace/switch-config.sh"
gen toml-cli "merge $homesrc_dir/aerospace/aerospace-base.toml $homesrc_dir/aerospace/nogaps-override.toml -o /tmp/out.toml && cat /tmp/out.toml" ".config/aerospace/aerospace-nogaps.toml"
