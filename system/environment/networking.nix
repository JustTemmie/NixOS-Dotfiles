{ lib, config, ... }: {
  config = lib.mkIf config.myModules.system.networking.enable {
    networking.networkmanager.enable = true;
    networking.firewall.enable = false;
  };
}