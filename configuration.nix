# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  imports = [
      ./applications/init.nix
      ./environment/init.nix
      ./home/init.nix
      ./services/init.nix
  ];

  systemd.tmpfiles.settings."10-nixos-directory"."/etc/nixos".d = {
    group = "wheel";
    mode = "0755";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # use latest kernel by default
  boot.kernelPackages = pkgs.linuxPackages;

  programs.fish.enable = true;
  programs.nix-ld.enable = true; # enable system support for unpatched binaries
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
  services.libinput.enable = true;

  fonts.fontDir.enable = true;
  fonts.fontconfig.useEmbeddedBitmaps = true;

  time.timeZone = "Europe/Oslo";
  i18n.defaultLocale = "en_GB.UTF-8";

  system.autoUpgrade.enable = true;
  system.flake.autoUpgrade.enable = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
