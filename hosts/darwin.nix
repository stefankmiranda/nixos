{ pkgs, ... }:

{
  home = {
    username = "stefmira";
    homeDirectory = "/Users/stefmira";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;

  # macOS-specific packages
  home.packages = with pkgs; [
    coreutils
  ];
}
