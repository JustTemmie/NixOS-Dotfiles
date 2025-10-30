{ config, pkgs, ... }:

  let
    packagesCommandline = with pkgs; [
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

    packagesTerminalUI = with pkgs; [
      nano
      htop
    ];

    packagesCompilersAndInterpreters = with pkgs; [
      libglvnd
      libglibutil
      typescript
      nodePackages.nodejs
      pnpm
    ];

    packagesNix = with pkgs; [
      nix-index
    ];

    packagesSystem = with pkgs; [
      btrfs-progs
      cifs-utils
    ];

    packagesMisc = with pkgs; [
      vulkan-tools
    ];
  in
{
  environment.systemPackages =
    packagesCommandline ++
    packagesTerminalUI ++
    packagesCompilersAndInterpreters ++
    packagesNix ++
    packagesSystem ++
    packagesMisc;
}
