{ lib, config, pkgs, ... }:
  let
    packagesUniversal = with pkgs; [
      unp # universal unzipper
      unrar-free # required by rar by unp
      unzip

      hyfetch
      fastfetch
      onefetch
      yt-dlp
      nmap
      xdg-utils
      pigz
      tree
      file
      glow # markdown viewer
    ];

    packagesGraphical = with pkgs; [
      baobab
      nautilus
      mission-center
      obs-studio
      qbittorrent
      mpv
      kdePackages.kdeconnect-kde

      stable.imv
      stable.tenacity
    ];

    packagesFonts = with pkgs; [
      stable.nerd-fonts.fira-code

      stable.noto-fonts
      stable.noto-fonts-lgc-plus
      stable.noto-fonts-cjk-sans
      stable.noto-fonts-cjk-serif
      stable.noto-fonts-color-emoji
      stable.noto-fonts-emoji-blob-bin
    ];

    packagesGamedev = with pkgs; [
      godot
      godotPackages.export-template
      blender

      stable.jetbrains.idea-oss
      blockbench
    ];

    packagesAudioVisual = with pkgs; [
      stable.kdePackages.kdenlive
      stable.lmms
      gimp
      krita
      inkscape
    ];

    packagesSchool = with pkgs; [
      hyperfine
      stable.pandoc
      stable.texlive.combined.scheme-small
      stable.onlyoffice-desktopeditors

      geogebra
    ];

    packagesGaming = with pkgs; [
      r2modman
      # lutris
      # stable.rpcs3

      wine
      winetricks
      protontricks
      protonplus
    ];
  in
{
  home.packages =
    packagesUniversal ++
    packagesGraphical ++
    packagesFonts ++
    lib.optionals config.myModules.home.gamedev.enable packagesGamedev ++
    lib.optionals config.myModules.home.audioVisual.enable packagesAudioVisual ++
    lib.optionals config.myModules.home.school.enable packagesSchool ++
    lib.optionals config.myModules.home.gaming.enable packagesGaming ++
    lib.optionals config.myModules.home.signaldesktop.enable [ pkgs.signal-desktop ];
}
