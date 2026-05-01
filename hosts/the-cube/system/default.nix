{ lib, config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix

    ./gpu.nix
    ./machine-modules.nix
    # ./vr.nix
  ];

  config.environment.systemPackages = [
    pkgs.sm64coopdx
  ];

  networking.hostName = "the-cube";

  networking = {
    interfaces.enp17s0 = {
      useDHCP = lib.mkDefault true;
    };
    defaultGateway = {
      address = "192.168.1.1";
      interface = "enp17s0";
    };

    nameservers = [ "192.168.1.1" "9.9.9.9" ];
  };
}
