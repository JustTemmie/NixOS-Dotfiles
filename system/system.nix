{ config, pkgs, ... }: {
  imports = [
    ./apps/docker.nix
    ./apps/steam.nix
    ./apps/yazi.nix

    ./environment/audio.nix
    ./environment/cosmic.nix
    ./environment/fonts.nix
    ./environment/keyboard.nix
    ./environment/locale.nix
    ./environment/networking.nix
    # ./environment/niri.nix
    ./environment/nix.nix
    ./environment/users.nix
    
    ./system-packages.nix
  ];

  services.libinput.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # use latest kernel by default
  boot.kernelPackages = pkgs.linuxPackages;

  programs.fish.enable = true; # i get issues if i don't enable this
  programs.nix-ld.enable = true; # enable system support for unpatched binaries
}

