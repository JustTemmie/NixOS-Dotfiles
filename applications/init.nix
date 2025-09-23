{
  imports = [
    ./system-packages.nix

    ./apps/firefox.nix
    ./apps/steam.nix
    ./apps/docker.nix
    ./apps/yazi.nix

    ./languages/c.nix
    ./languages/python.nix
    ./languages/rust.nix
  ];
}

