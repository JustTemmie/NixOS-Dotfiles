{ config, pkgs, ... }: {
  programs.git = {
    enable = true;
    diff-so-fancy.enable = true;
    signing.signByDefault = true;
    userEmail = "git@beaver.mom";
    userName = "Temmie";

    extraConfig = {
      init.defaultBranch = "main";
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "/home/twig/.ssh/id_ed25519";
    };
  };
}
