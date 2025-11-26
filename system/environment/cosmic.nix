{ config, pkgs, ... }: {
  services.xserver.enable = true;

  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = 1;

  # global clipboard control
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
}
