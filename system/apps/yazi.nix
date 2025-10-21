{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    (yazi.override {
      _7zz = _7zz-rar;
    })
    jq
    fd
    ripgrep
    poppler
    resvg
  ];
} 
