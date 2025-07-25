{ config, pkgs, ... }:

  let
    packagesCommandline = with pkgs; [
      wget
      curl
      ffmpeg
      hyfetch
      fastfetch
      onefetch
      nodePackages.nodejs
      pnpm
      gnupg
      psmisc
      nmap
      wireguard-tools
      yt-dlp
      spotdl
      streamrip
      unp # universal unzipper
    ];

    packagesTerminalUI = with pkgs; [
      neovim
      nano
      htop
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
      mpv
    ];

    packagesCompilersAndInterpreters = with pkgs; [
      gcc
      rustup
      python313
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