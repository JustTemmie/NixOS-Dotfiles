{ config, pkgs, ... }:

{
  home.shell.enableFishIntegration = true;

  programs.fish = {
    enable = true;
    shellInit = "source /etc/nixos/settings/fish/init.fish";
  };
}
