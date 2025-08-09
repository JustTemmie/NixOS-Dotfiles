# this doesn't work, may want to make this into a user service instead
{
  systemd.services.startup-git-pull-nixos = {
    description = "Run git pull in /etc/nixos at startup";
 
    serviceConfig = {
      Type = "oneshot";
      WorkingDirectory = "/etc/nixos";
      ExecStart = "git -C /etc/nixos pull";
    };

    wantedBy = [ "multi-user.target" ];
  };
}
