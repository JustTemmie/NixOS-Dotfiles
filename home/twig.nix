{ config, pkgs, lib, ... }: {
  programs.home-manager.enable = true;

  imports = [
    ./apps/codium.nix
    ./apps/firefox.nix
    ./apps/fish.nix
    ./apps/git.nix
    ./apps/kitty.nix
    ./apps/ncmpcpp.nix
    ./apps/prismlauncher.nix
    ./apps/python.nix
#      ./apps/rmpc.nix disabled until rmpc 0.9 is a nix pkg, maybe i should actually try flakes!??! 
    ./apps/ssh.nix

    # ./environment/fonts.nix

    # ./services/mpd-discord-rpc.nix steam presence
    ./services/mpd-scribble.nix
    ./services/mpd.nix

    ./user-packages.nix
  ];

  home = {
    username = "twig";
    homeDirectory = "/home/twig";

    stateVersion = "25.05";
  };
  
}
