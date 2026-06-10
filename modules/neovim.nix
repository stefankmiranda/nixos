{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    # Dependencies for NvChad / treesitter / LSPs
    gcc
    gnumake
    unzip
    tree-sitter
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.shellAliases = {
    vim = "nvim";
    vi = "nvim";
  };

  # Clone NvChad on first activation if ~/.config/nvim doesn't exist
  home.activation.cloneNvChad = ''
    if [ ! -d "$HOME/.config/nvim" ]; then
      ${pkgs.git}/bin/git clone https://github.com/NvChad/starter "$HOME/.config/nvim" 2>/dev/null || true
    fi
  '';
}
