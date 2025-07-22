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
      ./desktop/audio.nix

      ./home-manager/home.nix

      ./applications/init.nix

      ./hardware.nix
  ];

  users.users.twig = {
    isNormalUser = true;
    description = "Miku Hatsune";
    extraGroups = [ "networkmanager" "wheel" ];
    
    uid = 1000;

    shell = pkgs.fish;
  };

  systemd.tmpfiles.settings."10-nixos-directory"."/etc/nixos".d = {
    group = "wheel";
    mode = "0755";
  };


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
