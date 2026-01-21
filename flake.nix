{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-25.11";

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

    mkPC = { hardwareModule }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; inherit pkgs-stable; };
        modules = [
          ./system/system.nix
          hardwareModule

          home-manager.nixosModules.home-manager

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.twig = ./home/twig.nix;
              users.mae = ./home/mae.nix;
            };
          }
        ];
      };
  in {
    nixosConfigurations = {
      "the-cube" = mkPC {
        hardwareModule = ./hosts/the-cube/the-cube.nix;
      };
      "serenity" = mkPC {
        hardwareModule = ./hosts/serenity/serenity.nix;
      };
    };
  };
}
