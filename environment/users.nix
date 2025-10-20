{ config, lib, pkgs, ... }: {
  users.users.twig = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    description = "Hatsune Miku";

    uid = 1000;

    shell = pkgs.fish;
  };
}