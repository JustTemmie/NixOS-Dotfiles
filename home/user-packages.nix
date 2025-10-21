{ config, pkgs, pkgs-stable, ... }:
  let
    packagesCommandline = with pkgs; [
      unp # universal unzipper
      hyfetch
      fastfetch
      onefetch
      yt-dlp
      nmap
      xdg-utils
      pigz
      tree
      file
      hyperfine
      pandoc
      texlive.combined.scheme-small
      mpc
    ];

    packagesTerminalUI = with pkgs; [
      glow # markdown viewer
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
      prismlauncher
      obs-studio
      vesktop
    ];

    packagesGraphicalStable = with pkgs-stable; [
      lmms
      imv
      signal-desktop
    ];

    packagesMisc = with pkgs; [
      nerd-fonts.fira-code

      noto-fonts
      noto-fonts-lgc-plus
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      noto-fonts-emoji-blob-bin
    ];
  in
{
  home.packages =
    packagesCommandline ++
    packagesTerminalUI ++
    packagesGraphical ++
    packagesGraphicalStable ++
    packagesMisc;
}
