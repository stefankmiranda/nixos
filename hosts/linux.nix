{ pkgs, ... }:

{
  home = {
    username = "stefmira";
    homeDirectory = "/home/stefmira";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;

  # Linux-specific packages
  home.packages = with pkgs; [
    xclip
  ];
}
