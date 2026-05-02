{ lib, ... }: {
  config.myModules.system = {
    samba.enable = lib.mkForce false;
    syncthing.enable = lib.mkForce true;
    mullvad.enable = lib.mkForce true;
  };
}