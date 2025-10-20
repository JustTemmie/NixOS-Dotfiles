{ config, pkgs, lib, ... }: {
  programs.home-manager.enable = true;

  imports = [
    ./packages/codium.nix
    ./packages/firefox.nix
    ./packages/fish.nix
    ./packages/git.nix
    ./packages/kitty.nix
    ./packages/mpd-discord-rpc.nix
    ./packages/mpd.nix
    ./packages/ncmpcpp.nix
    ./packages/python.nix
#      ./packages/rmpc.nix disabled until rmpc 0.9 is a nix pkg, maybe i should actually try flakes!??! 
    ./packages/ssh.nix

    ./user-packages.nix
  ];

  home = {
    username = "twig";
    homeDirectory = "/home/twig";

    stateVersion = "25.05";
  };
  
}
