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

  fileSystems."/home/twig/Network" = {
    device = "//192.168.1.20/";
    fsType = "cifs";
    options = options;
  };
}
