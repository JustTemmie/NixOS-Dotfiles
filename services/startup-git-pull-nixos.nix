{
  systemd.services.startup-git-pull-nixos {
    script = ''
      git pull
    '';

    type = "oneshot";
    WorkingDirectory = "/etc/nixos";
    wantedBy = [ "multi-user.target" ];
  };
}
