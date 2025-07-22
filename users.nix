{ pkgs, ... }:

{  
  users.users.twig = {
    isNormalUser = true;
    description = "Miku Hatsune";
    extraGroups = [ "networkmanager" "wheel" ];
    
    uid = 1000;

    shell = pkgs.fish;
  };
}
