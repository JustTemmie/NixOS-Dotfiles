{ config, inputs, pkgs, ... }: {
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  environment.systemPackages = with pkgs; [ gamescope ];
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib

        xorg.libxcb dbus nss # Needed for electron-based shit I think

        # Needed for gamescope to work right
        libkrb5 keyutils

        gamemode

        cups # Needed for bitburner
      ];
    };
  };

  programs.steam.enable = true;
}




