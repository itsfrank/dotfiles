{
  config,
  pkgs,
  lib,
  ...
}:
let
  luneRun =
    luaFile:
    builtins.readFile (
      pkgs.runCommand "lune-output" { } ''
        ${pkgs.lune}/bin/lune run ${luaFile} > $out
      ''
    );
in
{
  home.username = "frk";
  home.homeDirectory = "/Users/frk";

  home.stateVersion = "24.05"; # dont change unless certain we want to migrate hm version

  nixpkgs.config = {
    allowBroken = true;
  };

  home.packages = [
    pkgs.neovim
    pkgs.tmux

    # shell stuff
    pkgs.starship

    # utils
    pkgs.fzf
    pkgs.ripgrep
    pkgs.fd
    pkgs.bat
    pkgs.eza
    pkgs.gitui
    pkgs.thefuck
    pkgs.carapace

    # languages
    pkgs.rustup # rust, execute `rustup toolchain install stable` to install rust
    pkgs.opam # ocaml
    pkgs.go # go
    pkgs.deno # js/ts
    pkgs.nodejs_24
    pkgs.zig # zig
    pkgs.nixfmt-rfc-style # nix, nixfmt isnt on mason

    # luau
    (pkgs.lune.overrideAttrs (oldAttrs: {
      meta.broken = false;
    })) # lune is currently marked as broken but seems to work fine

    # temporary
    pkgs.shfmt
  ];

  # zsh
  home.file.".zshrc".source = ./zshrc;
  home.file."sourceme.sh".source = ./sourceme.sh;
  # configs
  # home.file.".config/aerospace".source = ./aerospace;
  home.file.".config/frk".source = ./frk;
  home.file.".config/fzf".source = ./fzf;
  home.file.".config/ghostty".source = ./ghostty;
  home.file.".config/gitui".source = ./gitui;
  home.file.".config/sketchybar".source = ./sketchybar;
  home.file.".config/starship.toml".source = ./starship.toml;
  home.file.".config/tmux".source = ./tmux;
  home.file.".config/wezterm".source = ./wezterm;

  home.file.".config/karabiner/karabiner.json" = {
    text = luneRun ./karabiner/karabiner.luau;
    force = true;
  };

  # for the aerospace ultrawide gaps hack, remove when proper solution exists: https://github.com/nikitabobko/AeroSpace/issues/60
  # make sure to install toml-cli first with `go install github.com/MinseokOh/toml-cli@latest`
  home.activation.copyAerospaceConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    rm -rf $HOME/.config/aerospace
    mkdir -p $HOME/.config/aerospace
    cp ${./aerospace/switch-config.sh} $HOME/.config/aerospace/switch-config.sh
    cp ${./aerospace/aerospace-base.toml} $HOME/.config/aerospace/aerospace.toml
    cp ${./aerospace/aerospace-base.toml} $HOME/.config/aerospace/aerospace-gaps.toml
    chmod +w $HOME/.config/aerospace/aerospace.toml
    $HOME/go/bin/toml-cli merge ${./aerospace/aerospace-base.toml} ${./aerospace/nogaps-override.toml} -o $HOME/.config/aerospace/aerospace-nogaps.toml
  '';

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
