{
  imports = [
    ./services/init.nix
    
    ./system-packages.nix

    ./apps/docker.nix
    ./apps/steam.nix
    ./apps/yazi.nix
  ];
}

