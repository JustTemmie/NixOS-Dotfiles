{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    jq
    fd
    ripgrep
    poppler
    resvg
  ];
} 
