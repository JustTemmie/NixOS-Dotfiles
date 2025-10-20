{ config, pkgs, ... }: {
  programs.git = {
    enable = true;
    user= {
      email = "git@beaver.mom";
      name = "Twig";
    };

    signing = {
      signByDefault = true;
      format = "ssh";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINNd7ErkwCiFOOTU/imXWO/fbwJS6rSq5XJjplEK02Nm";
    };

    settings = {
      push.autoSetupRemove = true;
      branch.autoSetupMerge = true;
      init.defaultBranch = "main";
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "/home/twig/.ssh/id_ed25519.pub";
    };
  };
}
