{ pkgs, ... }: {
    virtualisation.docker = {
        enable = true;

        storageDriver = config.fileSystems."/".fsType;
        rootless = {
            enable = true;
            setSocketVariable = true;
        };
    };

    users.users.twig.extraGroups = [ "docker" ];

    environment.systemPackages = [ pkgs.docker ];
}
