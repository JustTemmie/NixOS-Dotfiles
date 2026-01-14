{ config, pkgs, ... }: {
  home.shell.enableFishIntegration = true;

  programs.fish = {
    enable = true;
    shellInit = "source /etc/nixos/persistent/fish/init.fish";
    interactiveShellInit = "nix-your-shell fish | source";
  };
}
