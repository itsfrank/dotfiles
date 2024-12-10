{ config, pkgs, ... }:
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
    pkgs.bat
    pkgs.eza
    pkgs.gitui

    # languages
    pkgs.rustup # rust, execute `rustup toolchain install stable` to install rust
    pkgs.opam # ocaml
    pkgs.go # go
    pkgs.deno # js/ts
    pkgs.nodejs_23
    pkgs.nixfmt-rfc-style # nix, nixfmt isnt on mason

    # luau
    (pkgs.lune.overrideAttrs (oldAttrs: {
      meta.broken = false;
    })) # lune is currently marked as broken but seems to work fine

    # temporary
    pkgs.shfmt
  ];

  # zsh
  home.file.".zshrc".source = ./.zshrc;
  home.file."sourceme.sh".source = ./sourceme.sh;
  # configs
  home.file.".config/gitui".source = ./gitui;
  home.file.".config/tmux".source = ./tmux;
  home.file.".config/wezterm".source = ./wezterm;
  home.file.".config/starship.toml".source = ./starship.toml;
  home.file.".config/frk".source = ./frk;
  home.file.".config/fzf".source = ./fzf;
  # home.file.".config/karabiner".source = ./karabiner;

  home.file.".config/karabiner/karabiner.json" = {
    text = luneRun ./karabiner/karabiner.luau;
    force = true;
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
