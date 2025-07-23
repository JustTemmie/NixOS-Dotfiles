{ config, pkgs, ... }:

  let
    packagesCommandline = with pkgs; [
      wget
      curl
      ffmpeg
      hyfetch
      fastfetch
      nodePackages.nodejs
      pnpm
      gnupg
      wireguard-tools
      nmap
      yt-dlp
      spotdl
      streamrip
      psmisc
      unp # universal unzipper
      onefetch
    ];

    packagesTerminalUI = with pkgs; [
      neovim
      nano
      htop
    ];

    packagesGraphical = with pkgs; [
      godot
      signal-desktop
      pavucontrol
      protonplus
      nautilus
      mpv
      mission-center
      typora
      prismlauncher
      obs-studio
      gimp
      krita
      inkscape
      onlyoffice-desktopeditors
      kdePackages.kdenlive
      blender
      tenacity
      ungoogled-chromium
      geogebra
      baobab
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