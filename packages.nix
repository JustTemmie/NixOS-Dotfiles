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

    gcc
    rustup

    ly

    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono

    kitty
    godot
    signal-desktop
    vesktop
    pavucontrol
    protonplus
  ];

  programs.fish.enable = true;
  programs.nix-ld.enable = true;
}

