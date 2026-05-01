{ lib, ... }: {
  config.myModules.system = {
    samba.enable = false;
  };
}