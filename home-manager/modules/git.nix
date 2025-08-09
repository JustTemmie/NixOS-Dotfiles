{ config, pkgs, ... }: {
  programs.git = {
    enable = true;
    diff-so-fancy.enable = true;
    userEmail = "git@beaver.mom";
    userName = "Temmie";

    signing = {
      signByDefault = true;
      format = "ssh";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINNd7ErkwCiFOOTU/imXWO/fbwJS6rSq5XJjplEK02Nm";
    };

    extraConfig = {
      push.autoSetupRemove = true;
      branch.autoSetupMerge = true;
      init.defaultBranch = "main";
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "/home/twig/.ssh/id_ed25519.pub";
    };
  };
}
