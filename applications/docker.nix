{ pkgs, ... }: {
    virtualisation.docker = {
        enable = true;

        storageDriver = "btrfs";
        rootless = {
            enable = true;
            setSocketVariable = true;
        };
    };

    users.extraGroups.docker.members = [ "twig" ];
    users.users.twig.extraGroups = [ "docker" ];

    environment.systemPackages = [ pkgs.docker ];
}
