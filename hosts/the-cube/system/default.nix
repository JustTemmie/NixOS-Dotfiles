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
      ipv4.addresses = [{
        address = "192.168.9.20"; 
        prefixLength = 20;
      }]
      wakeOnLan.enable = true;
    };
    defaultGateway = {
      address = "192.168.1.1";
      interface = "enp17s0";
    };

    nameservers = [ "192.168.1.1" "9.9.9.9" ];
  };
}
