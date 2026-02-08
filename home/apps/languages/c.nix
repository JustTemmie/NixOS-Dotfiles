{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    (hiPrio gcc) # get the c++ binary from gcc, not clang
    clang
    gnumake
  ];
}