{ lib, ... }: {
  config.myModules.system = {
    syncthing.enable = lib.mkForce true;
    mullvad.enable = lib.mkForce true;
  };
}