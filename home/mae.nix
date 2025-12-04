{ config, pkgs, lib, ... }: {
  imports = [
    ./apps/codium.nix
    ./apps/firefox.nix
    ./apps/fish.nix
    ./apps/kitty.nix
    ./apps/ncmpcpp.nix
    ./apps/prismlauncher.nix
    ./apps/python.nix
    ./apps/rmpc.nix
    ./apps/vesktop.nix

    ./services/mpd.nix

    ./user-packages.nix
  ];

  programs.home-manager.enable = true;

  home = {
    packages = with pkgs; [
      git
    ];
    username = "mae";
    homeDirectory = "/home/mae";
    stateVersion = "25.05";
  };
}
