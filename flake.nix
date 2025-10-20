{
  description = "A very basic flake";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-stable, home-manager, ... } @ inputs:
  let
    system = "x86_64-linux";
    pkgs-unstable = nixpkgs.legacyPackages.${system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};
  in {
    nixosConfigurations = {
      "the-cube" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; inherit pkgs-unstable; inherit pkgs-stable; };
        modules = [
          ./configuration.nix
          ./hardware/desktop.nix

          home-manager.nixosModules.home-manager

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; inherit pkgs-unstable; inherit pkgs-stable; };
              users.twig = ./home/twig.nix;
            };
          }
        ];
      };
    };
  };
}
