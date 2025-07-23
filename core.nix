{ config, pkgs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  programs.fish.enable = true;
  programs.nix-ld.enable = true;

  networking.networkmanager.enable = true;
  services.libinput.enable = true;

  # Improve Font support
  fonts.fontDir.enable = true;
  fonts.fontconfig.useEmbeddedBitmaps = true;

  time.timeZone = "Europe/Oslo";
  i18n.defaultLocale = "en_GB.UTF-8";
}

