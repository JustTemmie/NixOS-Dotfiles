{
  # Enable networking
  networking.networkmanager.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  systemd.tmpfiles.settings."10-nixos-directory"."/etc/nixos".d = {
    group = "wheel";
    mode = "0755";
  };
}
