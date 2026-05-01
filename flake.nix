{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-25.11";

    home-manager.url = "github:nix-community/home-manager";
    nix-index-database.url = "github:nix-community/nix-index-database";
  };

  outputs = inputs @ { nixpkgs, nixpkgs-stable, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};

    mkPC = { hardwareModule, homeModule }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; inherit pkgs-stable; };
        modules = [
          ./system/system.nix
          hardwareModule

          inputs.home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              sharedModules = [ homeModule ];
              users.twig = ./home/twig.nix;
            };
          }
          
          inputs.nix-index-database.nixosModules.default
          {
            programs.nix-index.enable = true;
            programs.nix-index-database.comma.enable = true;
          }
        ];
      };
  in {
    nixosConfigurations = {
      "the-cube" = mkPC {
        hardwareModule = ./hosts/the-cube/system/default.nix;
        homeModule = ./hosts/the-cube/home/default.nix;
      };
      "serenity" = mkPC {
        hardwareModule = ./hosts/serenity/system/default.nix;
        homeModule = ./hosts/serenity/home/default.nix;
      };
    };
  };
}
