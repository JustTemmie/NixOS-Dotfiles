{ pkgs, ... }: {
  services.desktopManager.plasma6.enable = true;

  # KDE Plasma in Wayland
  services.displayManager.defaultSession = "plasma";

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    oxygen
    elisa
  ];
}
