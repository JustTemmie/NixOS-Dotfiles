{ config, pkgs, ... }: {
    virtualisation.docker = {
        enable = true;

        rootless = {
            enable = true;
            setSocketVariable = true;
        };
    };

    users.users.twig.extraGroups = [ "docker" ];

    environment.systemPackages = [ pkgs.docker ];
}
