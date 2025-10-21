{
  imports = [
    ./apps/docker.nix
    ./apps/steam.nix
    ./apps/yazi.nix

    ./environment/cosmic.nix
    ./environment/audio.nix
    ./environment/keyboard.nix
    ./environment/users.nix
    
    ./system-packages.nix
  ];
}

