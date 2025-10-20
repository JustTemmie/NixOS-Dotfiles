{ config, lib, pkgs, ... }: {
  users.users.twig = {
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = [ "networkmanager" "wheel" ];
    description = "Hatsune Miku";

    uid = 1000;

    shell = pkgs.fish;
  };
}