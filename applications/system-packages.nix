{ config, pkgs, ... }:

  let
    packagesCommandline = with pkgs; [
      wget
      curl
      ffmpeg
      hyfetch
      fastfetch
      onefetch
      gnupg
      psmisc
      nmap
      wireguard-tools
      yt-dlp
      spotdl
      unp # universal unzipper
      lshw
      pciutils
      usbutils
      xdg-utils
      tree
      imagemagick
      pigz
    ];

    packagesTerminalUI = with pkgs; [
      neovim
      nano
      htop
      glow
    ];

    packagesGraphical = with pkgs; [
      onlyoffice-desktopeditors
      typora
      geogebra
      godot
      blender
      tenacity
      gimp
      krita
      inkscape
      pavucontrol
      protonplus
      ungoogled-chromium
      kdePackages.kdenlive
      baobab
      nautilus
      mission-center
      signal-desktop
      prismlauncher
      obs-studio
      vesktop
      imv
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
      ly

      jellyfin-rpc

      nerd-fonts.fira-code
    ];
  in
{
  environment.systemPackages =
    packagesCommandline ++
    packagesTerminalUI ++
    packagesGraphical ++
    packagesCompilersAndInterpreters ++
    packagesNix ++
    packagesSystem ++
    packagesMisc;
}
