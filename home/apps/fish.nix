{ config, pkgs, ... }: {
  home.shell.enableFishIntegration = true;

  programs.fish = {
    enable = true;
    shellInit = "source /etc/nixos/3rdPartyConfigs/fish/init.fish";
  };
}
