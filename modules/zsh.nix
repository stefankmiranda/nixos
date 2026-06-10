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

        # Zoxide integration
        eval "$(zoxide init zsh)"

        # Direnv hook
        eval "$(direnv hook zsh)"

        # Load p10k config if it exists
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      ''
    ];

    shellAliases = {
      python = "python3";
      pip = "pip3";
      ls = "eza";
      ll = "eza -la";
      la = "eza -a";
      cat = "bat";
      hms = "home-manager switch --flake ~/Projects/nixos#darwin";
      config = "nvim ~/.zshrc";
    };
  };
}
