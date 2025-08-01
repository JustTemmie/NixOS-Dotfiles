{ config, pkgs, ... }: {
  programs.git = {
    enable = true;
    diff-so-fancy.enable = true;
    userEmail = "git@beaver.mom";
    userName = "Temmie";
    signing.signByDefault = true;

    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "/home/twig/.ssh/id_ed25519";
    };
  };
}
