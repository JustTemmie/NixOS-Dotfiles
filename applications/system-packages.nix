{ config, pkgs-stable, pkgs-unstable, ... }:

  let
    packagesCommandline = with pkgs-stable; [
      wget
      curl
      ffmpeg
      imagemagick
      gnupg
      psmisc
      wireguard-tools
      lshw
      pciutils
      usbutils
      iptables
    ];

    packagesTerminalUI = with pkgs-stable; [
      nano
      htop
    ];

    packagesCompilersAndInterpreters = with pkgs-stable; [
      libglvnd
      libglibutil
      typescript
      nodePackages.nodejs
      pnpm
    ];

    packagesNix = with pkgs-stable; [
      nix-index
    ];

    packagesSystem = with pkgs-stable; [
      btrfs-progs
      cifs-utils
    ];

    packagesMisc = with pkgs-unstable; [
      vulkan-tools
    ];

  in
{
  environment.systemPackages =
    packagesCommandline ++
    packagesTerminalUI ++
    packagesNix ++
    packagesCompilersAndInterpreters ++
    packagesSystem ++
    packagesMisc;
}
