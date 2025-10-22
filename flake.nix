{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-stable, home-manager, ... } @ inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};

    mkHost = { hardwareModule }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; inherit pkgs-stable; };
        modules = [
          ./configuration.nix
          hardwareModule

          home-manager.nixosModules.home-manager

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.twig = ./home/twig.nix;
            };
          }
        ];
      };
  in {
    nixosConfigurations = {
      "the-cube" = mkHost {
        hardwareModule = ./hardware/desktop.nix;
      };
      "serenity" = mkHost {
        hardwareModule = ./hardware/laptop.nix;
      };
    };
  };
}
