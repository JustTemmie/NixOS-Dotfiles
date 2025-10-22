{ config, pkgs, ... }: {
  home.shell.enableFishIntegration = true;

  programs.fish = {
    enable = true;
    shellInit = "source /etc/nixos/persistent/fish/init.fish";
  };
}
