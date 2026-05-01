{ lib, config, pkgs, ... }: {
  config = lib.mkIf config.myModules.home.vesktop.enable {
    programs.vesktop.enable = true;
    
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/discord" = "vesktop.desktop";
      };
    };
  };
}