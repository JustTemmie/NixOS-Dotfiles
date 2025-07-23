{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nix-index

    neovim
    nano

    wget
    curl
    btrfs-progs
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
    htop
    psmisc

    gcc
    rustup
    python313

    ly

    nerd-fonts.fira-code

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

  programs.fish.enable = true;
  programs.nix-ld.enable = true;
}

