{ lib, config, pkgs, ... }: {
  config = lib.mkIf config.myModules.home.fish.enable {
    home.shell.enableFishIntegration = true;

    programs.fish = {
      enable = true;
      shellInit = "source /etc/nixos/persistent/fish/init.fish";
      interactiveShellInit = "nix-your-shell fish | source";
    };
  };
}
