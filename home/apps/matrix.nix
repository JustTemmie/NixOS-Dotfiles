{ lib, config, pkgs, ...}: {
  config = lib.mkIf config.myModules.home.matrix.enable {
    home.packages = with pkgs; [
      element-desktop
      fluffychat
      nheko
    ];
  };
}