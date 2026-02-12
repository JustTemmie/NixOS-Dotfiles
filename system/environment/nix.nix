{ config, pkgs, pkgs-stable, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      stable = pkgs-stable;
    };

    permittedInsecurePackages = [
      "olm-3.2.16" # matrix
    ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}