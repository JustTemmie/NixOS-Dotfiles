{ config, lib, pkgs, ... }: {
  users.users.twig = {
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = [ "networkmanager" "wheel" ];
    description = "Hatsune Miku";

    uid = 1000;

    shell = pkgs.fish;
  };

  users.users.mae = {
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = [ "networkmanager" ];
    description = "PUUUUPPY";

    uid = 1001;

    shell = pkgs.fish;
  };
}