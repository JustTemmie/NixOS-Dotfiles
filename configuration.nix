# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
      ./locale.nix
      ./kernel.nix
      ./users.nix
      ./system-packages.nix

      ./cosmic.nix
      ./audio.nix

      ./services.nix
      ./misc.nix
      ./home-manager.nix

      ./applications/init.nix

      ./hardware-configuration.nix
  ];
  networking.hostName = "serenity";

  fonts.fontDir.enable = true;
  fonts.fontconfig.useEmbeddedBitmaps = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
