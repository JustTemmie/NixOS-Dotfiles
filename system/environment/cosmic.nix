{ lib, config, pkgs, ... }: {
  config = lib.mkIf config.myModules.system.cosmic.enable {
    services = {
      xserver.enable = true;

      displayManager.cosmic-greeter.enable = true;

      desktopManager.cosmic = {
        enable = true;
        xwayland.enable = true;
      };
    };
    
    environment.cosmic.excludePackages = with pkgs; [
      cosmic-edit
      cosmic-player
      cosmic-store
      cosmic-term
    ];

    services.system76-scheduler.enable = true;
    
    # environment.sessionVariables.NIXOS_OZONE_WL = 1;

    # global clipboard control
    environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
  };
}
