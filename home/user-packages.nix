{ config, pkgs, ... }:
  let
    packagesCommandline = with pkgs; [
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
      hyperfine
      stable.pandoc
      stable.texlive.combined.scheme-small

      wine
      winetricks
      protontricks
    ];

    packagesTerminalUI = with pkgs; [
      glow # markdown viewer
    ];

    packagesGraphical = with pkgs; [
      blender
      gimp
      krita
      inkscape
      pavucontrol
      protonplus
      # ungoogled-chromium
      baobab
      nautilus
      mission-center
      obs-studio
      qbittorrent
      r2modman
      stable.kdePackages.kdenlive
      signal-desktop
      bs-manager
      mpv
      lutris
      qemu

      stable.rpcs3
      stable.onlyoffice-desktopeditors
      stable.imv
      stable.lmms
      stable.tenacity
      stable.bambu-studio
      stable.jetbrains.idea-oss
    ];

    packagesMisc = with pkgs; [
      stable.nerd-fonts.fira-code

      stable.noto-fonts
      stable.noto-fonts-lgc-plus
      stable.noto-fonts-cjk-sans
      stable.noto-fonts-cjk-serif
      stable.noto-fonts-color-emoji
      stable.noto-fonts-emoji-blob-bin
    ];

    packagesProprietary = with pkgs; [
      geogebra
    ];
  in
{
  home.packages =
    packagesCommandline ++
    packagesTerminalUI ++
    packagesGraphical ++
    packagesMisc ++
    packagesProprietary;
}
