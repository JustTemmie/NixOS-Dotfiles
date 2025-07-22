{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  services.geoclue2.enable = true;
  services.geoclue2.enableDemoAgent = false;
}
