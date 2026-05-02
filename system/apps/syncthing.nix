{ lib, config, ... }: {
  # disable the ~/sync folder
  systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true"; 

  services.syncthing = {
    enable = true;
    openDefaultPorts = true; # does not open gui port
    # guiAddress = "127.0.0.1:8384";
    user = "twig";
    configDir = "/home/twig/.config/syncthing";
  };
}