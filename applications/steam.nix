{ config, pkgs, ... }: {
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  programs = {
    gamescope = {
      enable = true;
#      capSysNice = true;
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;

      package = pkgs.steam.override {
        extraLibraries = pkgs: [
          pkgs.xorg.libxcb
        ];
        extraPkgs = pkgs': with pkgs'; [
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib # Provides libstdc++.so.6
          libkrb5
          keyutils
          libei
        ];
      };

      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}




