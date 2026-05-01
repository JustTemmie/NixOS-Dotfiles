{ lib, config, pkgs, ... }: {
  myModules.home = {
    
  };
  
  home = {
    packages = with pkgs; [
      git
    ];
    username = "mae";
    homeDirectory = "/home/mae";
    stateVersion = "25.05";
  };
}
