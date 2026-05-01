{ lib, config, pkgs, ... }: {
  imports = [
    ./default.nix
    ./system-packages.nix

    ./core/fonts.nix
    ./core/nix.nix
    ./core/users.nix
  ];

  services.flatpak.enable = true;
  services.libinput.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # use latest kernel by default
  boot.kernelPackages = pkgs.linuxPackages_latest;

  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  programs.fish.enable = true; # i get issues if i don't enable this
  programs.nix-ld.enable = true; # enable system support for unpatched binaries

  services.envfs.enable = true;
}

