{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user.name = "Stefan Miranda";
      user.email = "stefanmirandadev@gmail.com";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      rerere.enabled = true;
    };

    includes = [
      {
        condition = "gitdir:~/workplace/";
        contents = {
          user = {
            email = "stefmira@amazon.com.au";
          };
        };
      }
    ];
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      side-by-side = true;
      line-numbers = true;
      syntax-theme = "Catppuccin Mocha";
    };
  };

  home.packages = with pkgs; [
    lazygit
    git-absorb
  ];
}
