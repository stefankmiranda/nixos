{
  description = "Home Manager configuration for Stefan Miranda";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      darwinSystem = "aarch64-darwin";
      linuxSystem = "x86_64-linux";

      mkHome = { system, extraModules ? [] }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          modules = [
            ./modules/packages.nix
            ./modules/tmux.nix
            ./modules/neovim.nix
            ./modules/yazi.nix
            ./modules/zsh.nix
            ./modules/git.nix
          ] ++ extraModules;
        };
    in
    {
      homeConfigurations = {
        "darwin" = mkHome {
          system = darwinSystem;
          extraModules = [ ./hosts/darwin.nix ];
        };
        "linux" = mkHome {
          system = linuxSystem;
          extraModules = [ ./hosts/linux.nix ];
        };
      };
    };
}
