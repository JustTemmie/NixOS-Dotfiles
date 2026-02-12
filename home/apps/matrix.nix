{ config, lib, pkgs, ...}: {
  home.packages = with pkgs; [
    element-web
    fluffychat
    nheko
  ];
}