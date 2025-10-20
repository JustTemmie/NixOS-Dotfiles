{ config, pkgs, lib, ... }: {
  programs.home-manager.enable = true;

  imports = [
    # ./modules/codium.nix
    # ./modules/fish.nix
    # ./modules/git.nix
    # ./modules/kitty.nix
    # ./modules/mpd-discord-rpc.nix
    # ./modules/mpd.nix
    # ./modules/ncmpcpp.nix
#      ./modules/rmpc.nix disabled until rmpc 0.9 is a nix pkg, maybe i should actually try flakes!??! 
    # ./modules/ssh.nix
  ];

  home = {
    username = "twig";
    homeDirectory = "/home/twig";

    stateVersion = "25.05";
  };
  
}
