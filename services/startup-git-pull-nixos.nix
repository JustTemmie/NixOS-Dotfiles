{
  systemd.services.startup-git-pull-nixos = {
    description = "Run git pull in /etc/nixos at startup";

    serviceConfig = {
      Type = "oneshot";
      WorkingDirectory = "/etc/nixos";
      ExecStart = "/usr/bin/git -C /etc/nixos pull";
    };

    wantedBy = [ "multi-user.target" ];
  };
}
