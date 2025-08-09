{ config, pkgs, ... }: {
  users.users.twig = {
    isNormalUser = true;
    description = "Hatsune Miku";
    extraGroups = [ "networkmanager" "wheel" ];
    
    uid = 1000;

    shell = pkgs.fish;
  };
}
