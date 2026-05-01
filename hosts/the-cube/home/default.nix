{ lib, ... }: {
  imports = [
    ../../../home/default.nix
    ../../../home/user-packages.nix
  ];

  programs.home-manager.enable = true;

  myModules.home = {
    prismlauncher.enable = lib.mkForce true;
    
    gamedev.enable = lib.mkForce true;
    audioVisual.enable = lib.mkForce true;
    school.enable = lib.mkForce true;
    gaming.enable = lib.mkForce true;
    signaldesktop.enable = lib.mkForce true;
  };
}
