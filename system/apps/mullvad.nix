{ lib, config, ... }: {
  config = lib.mkIf config.myModules.system.mullvad.enable {
    services.mullvad-vpn.enable = true;
  };
}