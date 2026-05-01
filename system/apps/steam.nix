{ lib, config, pkgs, ... }: {
  config = lib.mkIf config.myModules.system.steam.enable {
    environment.systemPackages = with pkgs; [ gamescope gamescope-wsi ];

    hardware.steam-hardware.enable = true;

    nixpkgs.config.packageOverrides = pkgs: {
      steam = pkgs.steam.override {
        extraPkgs = pkgs: with pkgs; [
          libXcursor
          libXi
          libxinerama
          libxscrnsaver
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib

          libxcb dbus nss # Needed for electron-based shit I think

          # Needed for gamescope to work right
          libkrb5 keyutils

          gamemode

          cups # Needed for bitburner
        ];
      };
    };

    programs.steam = {
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}




