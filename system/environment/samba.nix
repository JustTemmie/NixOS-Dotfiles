{ config, lib, pkgs, ... }:
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
      "_netdev"
      "uid=1000"
    ];
  in
{
  options = {
    myModules.samba.enable = lib.mkEnableOption "Enable home samba shares";
  };

  config = lib.mkIf config.myModules.samba.enable {
    fileSystems."/home/twig/Documents" = {
      device = "//192.168.1.50/Documents";
      fsType = "cifs";
      options = options;
    };
    fileSystems."/home/twig/Downloads" = {
      device = "//192.168.1.50/Downloads";
      fsType = "cifs";
      options = options;
    };
    fileSystems."/home/twig/Music" = {
      device = "//192.168.1.50/Music";
      fsType = "cifs";
      options = options;
    };
      fileSystems."/home/twig/Photos" = {
      device = "//192.168.1.50/Photos";
      fsType = "cifs";
      options = options;
    };
    fileSystems."/home/twig/Pictures" = {
      device = "//192.168.1.50/Pictures";
      fsType = "cifs";
      options = options;
    };
    fileSystems."/home/twig/Videos" = {
      device = "//192.168.1.50/Videos";
      fsType = "cifs";
      options = options;
    };

    fileSystems."/home/twig/Pyra/NAS" = {
      device = "//192.168.1.50/Pyra";
      fsType = "cifs";
      options = options;
    };


    fileSystems."/home/twig/Network/Archive" = {
      device = "//192.168.1.50/Archive";
      fsType = "cifs";
      options = options;
    };
    fileSystems."/home/twig/Network/Dreams" = {
      device = "//192.168.1.50/Dreams";
      fsType = "cifs";
      options = options;
    };
    fileSystems."/home/twig/Network/Work" = {
      device = "//192.168.1.50/Work";
      fsType = "cifs";
      options = options;
    };
    fileSystems."/home/twig/Network/Media" = {
      device = "//192.168.1.50/Media";
      fsType = "cifs";
      options = options;
    };
    fileSystems."/home/twig/Network/Shared" = {
      device = "//192.168.1.50/Shared";
      fsType = "cifs";
      options = options;
    };
    fileSystems."/home/twig/Network/Torrents" = {
      device = "//192.168.1.50/Torrents";
      fsType = "cifs";
      options = options;
    };
    fileSystems."/home/twig/Network/Vault" = {
      device = "//192.168.1.50/Vault";
      fsType = "cifs";
      options = options;
    };
  };
}
