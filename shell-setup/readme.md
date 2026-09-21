# Shell setup

Copies the configurations in `../home` into a home directory without requiring a configuration manager.

Definitions stored in `./manifest.zsh`

```sh
./switch-sh          # install into $HOME
./switch-sh --dry    # print the commands without running them
./switch-sh --dst /path/to/home
```

The script requires `zsh`, `rsync`, `lute`, and `toml-cli` for the generated Karabiner and AeroSpace configurations.
