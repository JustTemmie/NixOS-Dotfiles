{
  imports = [
    ./system-packages.nix

    ./apps/docker.nix
    ./apps/firefox.nix
    ./apps/steam.nix
#    ./apps/waydroid.nix
    ./apps/yazi.nix

    ./languages/c.nix
    ./languages/python.nix
    ./languages/rust.nix
  ];
}

