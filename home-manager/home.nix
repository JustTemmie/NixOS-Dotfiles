{ config, pkgs, lib, ... }:

let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
in
{
  imports = [
      (import "${home-manager}/nixos")
  ];

  home-manager.users.twig = { pkgs, ... }: {
    imports = [
      ./modules/codium.nix
      ./modules/fish.nix
      ./modules/git.nix
      ./modules/ncmpcpp.nix
      ./modules/ssh.nix
    ];

    # The state version is required
    home.stateVersion = "25.05";
  };
}
