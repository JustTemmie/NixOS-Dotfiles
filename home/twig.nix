{ lib, pkgs, ... }: {
  myModules.home = {
    codium.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    mpd.enable = lib.mkDefault true;
    ssh.enable = lib.mkDefault true;
  };

  home = {
    username = "twig";
    homeDirectory = "/home/twig";
    stateVersion = "25.05";
  };
}
