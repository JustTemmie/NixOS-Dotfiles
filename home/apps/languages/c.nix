{ config, pkgs, lib, ... }: {
  home.packages = with pkgs; [
    (lib.hiPrio gcc) # get the c++ binary from gcc, not clang
    clang
    gnumake
  ];
}