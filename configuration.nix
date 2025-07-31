# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
      ./core.nix
      ./packages.nix

      ./desktop/cosmic.nix
      ./desktop/ly.nix
      ./desktop/audio.nix

      ./home-manager/home.nix
      ./applications/init.nix

      ./hardware.nix
  ];

  users.users.twig = {
    isNormalUser = true;
    description = "Hatsune Miku";
    extraGroups = [ "networkmanager" "wheel" ];
    
    uid = 1000;

    shell = pkgs.fish;
  };

  systemd.tmpfiles.settings."10-nixos-directory"."/etc/nixos".d = {
    group = "wheel";
    mode = "0755";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "colemak";
  };

  system.autoUpgrade.enable = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
