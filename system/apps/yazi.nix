{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    yazi
    jq
    fd
    ripgrep
    poppler
    resvg
  ];
} 
