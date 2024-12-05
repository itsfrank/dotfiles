{ config, pkgs, ... }:

{
  home.username = "frk";
  home.homeDirectory = "/Users/frk";

  home.stateVersion = "24.05"; # dont change unless certain we want to migrate hm version

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
  home.file.".config/karabiner".source = ./karabiner;

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
