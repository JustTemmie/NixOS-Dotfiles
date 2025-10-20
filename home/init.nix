{ config, pkgs, lib, ... }: {
  imports = [
    ./users.nix

    ./modules/codium.nix
    ./modules/fish.nix
    ./modules/git.nix
    ./modules/kitty.nix
    ./modules/mpd-discord-rpc.nix
    ./modules/mpd.nix
    ./modules/ncmpcpp.nix
#      ./modules/rmpc.nix disabled until rmpc 0.9 is a nix pkg, maybe i should actually try flakes!??! 
    ./modules/ssh.nix
  ];

  home = {
    users.users.twig = {
      isNormalUser = true;
      description = "Hatsune Miku";
      extraGroups = [ "networkmanager" "wheel" ];
      
      uid = 1000;

      shell = pkgs.fish;
    };

    stateVersion = "25.05";
  };
}
