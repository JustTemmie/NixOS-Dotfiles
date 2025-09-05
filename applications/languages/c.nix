{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gcc
    gdb
    gnumake
    clang
  ];
}
