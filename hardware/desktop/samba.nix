{ pkgs, ... }:

  let
    options = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=60"
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"
      "user"
      "users"
      "credentials=/etc/nixos/private/smb-secrets"
      "uid=1000"
    ];
  in
{
  environment.systemPackages = [ pkgs.cifs-utils ];

  fileSystems."/home/twig/Documents" = {
    device = "//192.168.1.20/Documents";
    fsType = "cifs";
    options = options;
  };
  fileSystems."/home/twig/Downloads" = {
    device = "//192.168.1.20/Downloads";
    fsType = "cifs";
    options = options;
  };
  fileSystems."/home/twig/Music" = {
    device = "//192.168.1.20/Music";
    fsType = "cifs";
    options = options;
  };
    fileSystems."/home/twig/Photos" = {
    device = "//192.168.1.20/Photos";
    fsType = "cifs";
    options = options;
  };
  fileSystems."/home/twig/Pictures" = {
    device = "//192.168.1.20/Pictures";
    fsType = "cifs";
    options = options;
  };
  fileSystems."/home/twig/Videos" = {
    device = "//192.168.1.20/Videos";
    fsType = "cifs";
    options = options;
  };

  fileSystems."/home/twig/Pyra/NAS" = {
    device = "//192.168.1.20/Pyra";
    fsType = "cifs";
    options = options;
  };


  fileSystems."/home/twig/Network/Archive" = {
    device = "//192.168.1.20/Archive";
    fsType = "cifs";
    options = options;
  };
  fileSystems."/home/twig/Network/Dreams" = {
    device = "//192.168.1.20/Dreams";
    fsType = "cifs";
    options = options;
  };
  fileSystems."/home/twig/Network/Work" = {
    device = "//192.168.1.20/Work";
    fsType = "cifs";
    options = options;
  };
  fileSystems."/home/twig/Network/Media" = {
    device = "//192.168.1.20/Media";
    fsType = "cifs";
    options = options;
  };
  fileSystems."/home/twig/Network/Torrents" = {
    device = "//192.168.1.20/Torrents";
    fsType = "cifs";
    options = options;
  };
  fileSystems."/home/twig/Network/Vault" = {
    device = "//192.168.1.20/Vault";
    fsType = "cifs";
    options = options;
  };
}
