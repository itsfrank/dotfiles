{
  description = "frank's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nix-homebrew,
    }:
    let
      configuration =
        { pkgs, config, ... }:
        {
          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = [
            pkgs.home-manager
          ];

          homebrew = {
            enable = true;
            taps = [
              "FelixKratz/formulae" # for sketchybar
              "nikitabobko/tap" # for aerospace
            ];
            brews = [
              "mas"
              "pkl"
              "sketchybar"
              "borders"
            ];
            casks = [
              "ghostty"
              "wezterm"
              "zen-browser"
              "karabiner-elements"
              "raycast"
              "aerospace"
            ];
            masApps = {
              # use `mas search tof ind them`
              # "Yoink" = 457622435;
            };
            onActivation.cleanup = "zap";
          };

          fonts.packages = [
            pkgs.nerd-fonts.sauce-code-pro
            pkgs.nerd-fonts.hack
          ];

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Enable alternative shell support in nix-darwin.
          programs.zsh.enable = true;

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 5;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations."frk" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "frk";
            };
          }
        ];
      };
    };
}
