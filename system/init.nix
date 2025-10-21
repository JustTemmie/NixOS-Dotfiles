{
  imports = [
    ./services/init.nix
    
    ./system-packages.nix

    ./packages/docker.nix
    ./packages/steam.nix
    ./packages/yazi.nix
  ];
}

