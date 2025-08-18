{ pkgs, ... }: {
    virtualisation.docker = {
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