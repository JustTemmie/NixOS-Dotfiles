{ lib, config, ... }: {
  config = lib.mkIf config.myModules.system.colemak.enable {
    services.xserver.xkb = {
      layout = "us";
      variant = "colemak";
    };

    console.useXkbConfig = true;
  };
}
