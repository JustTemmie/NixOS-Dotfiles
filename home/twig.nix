{ config, pkgs, lib, ... }: {
  imports = [
    ./apps/languages/python.nix
    ./apps/languages/c.nix

    ./apps/codium.nix
    ./apps/cursor.nix
    ./apps/firefox.nix
    ./apps/fish.nix
    ./apps/git.nix
    ./apps/kitty.nix
    ./apps/matrix.nix
    ./apps/ncmpcpp.nix
    ./apps/prismlauncher.nix
    ./apps/rmpc.nix
    ./apps/ssh.nix
    ./apps/vesktop.nix

    ./services/mpd-scribble.nix
    ./services/mpd.nix

    ./user-packages.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "twig";
    homeDirectory = "/home/twig";
    stateVersion = "25.05";
  };
}
