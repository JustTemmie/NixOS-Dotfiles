{ lib, config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix

    ./graphics.nix
    ./modules.nix
  ];

  networking.hostName = "serenity";

  # use LTS kernel due to nvidia drivers
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages;
}
