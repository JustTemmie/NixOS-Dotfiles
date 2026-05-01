{ lib, config, ... }: {
  config = lib.mkIf config.myModules.system.locale.enable {
    time.timeZone = "Europe/Oslo";
    i18n.defaultLocale = "en_GB.UTF-8";
  };
}