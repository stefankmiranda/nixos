{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Core utilities
    curl
    wget
    ripgrep
    fd
    jq
    fzf
    tree
    htop
    unzip
    bash

    # Modern CLI replacements
    bat
    eza
    zoxide
    dust

    # Dev tools
    gh
    direnv
    gnumake

    # Language runtimes
    go
    nodejs
    python3
    uv
    rustup
  ];

  # Install stable toolchain on first activation if none exists
  home.activation.rustupInit = ''
    if [ -x "$(command -v rustup)" ] && ! rustup show active-toolchain >/dev/null 2>&1; then
      rustup default stable
    fi
  '';
}
