{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    diff-so-fancy.enable = true;
    userEmail = "git@beaver.mom";
    userName = "beaver";
    signing.signByDefault = true;

    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
}
