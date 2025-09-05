{ config, pkgs, ... }:

  let
    packagesCommandline = with pkgs; [
      unp # universal unzipper
      wget
      curl
      hyfetch
      fastfetch
      onefetch
      yt-dlp
      ffmpeg
      imagemagick
      gnupg
      psmisc
      nmap
      wireguard-tools
      lshw
      pciutils
      usbutils
      xdg-utils
      pigz
      tree
      file
      jq
      fd
      rg
      resvg
    ];

    packagesTerminalUI = with pkgs; [
      neovim
      nano
      htop
      glow # markdown viewer
      yazi
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
      cyberchef
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
