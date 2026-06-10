{ pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    initContent = lib.mkMerge [
      (lib.mkBefore ''
        # Powerlevel10k instant prompt
        if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi
      '')
      ''
        # Go paths
        export GOPATH=$HOME/go
        export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

        # Toolbox, scripts, AIM
        export PATH="$HOME/.toolbox/bin:$PATH"
        export PATH="$HOME/scripts:$PATH"
        export PATH="$HOME/.aim/mcp-servers:$PATH"
        export PATH="$HOME/.cargo/bin:$PATH"

        # Homebrew (macOS)
        if [[ -f /opt/homebrew/bin/brew ]]; then
          eval "$(/opt/homebrew/bin/brew shellenv)"
        fi

        # Zoxide integration
        eval "$(zoxide init zsh)"

        # Direnv hook
        eval "$(direnv hook zsh)"

        # Load p10k config if it exists
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

        # Host-specific overrides (not managed by nix)
        [[ ! -f ~/.zshrc.local ]] || source ~/.zshrc.local
      ''
    ];

    shellAliases = {
      python = "python3";
      pip = "pip3";
      ls = "eza";
      ll = "eza -la";
      la = "eza -a";
      cat = "bat";
      hms = "home-manager switch --flake ~/nixos";
      config = "nvim ~/nixos/modules/zsh";
      tstart = "~/scripts/tstart";
    };
  };
}
