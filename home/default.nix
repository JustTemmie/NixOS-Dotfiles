{ lib, ... }: {
  imports = [
    ./apps/languages/python.nix
    ./apps/languages/c.nix

    ./apps/codium.nix
    ./apps/firefox.nix
    ./apps/fish.nix
    ./apps/git.nix
    ./apps/kitty.nix
    ./apps/matrix.nix
    ./apps/miku_cursor.nix
    ./apps/ncmpcpp.nix
    ./apps/prismlauncher.nix
    ./apps/ssh.nix
    ./apps/vesktop.nix

    ./services/mpd-scribble.nix
    ./services/mpd.nix
  ];

  options.myModules.home = {
    codium.enable = lib.mkEnableOption "Enable codium";
    firefox.enable = lib.mkEnableOption "Enable firefox";
    fish.enable = lib.mkEnableOption "Enable fish";
    git.enable = lib.mkEnableOption "Enable git";
    kitty.enable = lib.mkEnableOption "Enable kitty";
    matrix.enable = lib.mkEnableOption "Enable matrix";
    miku_cursor.enable = lib.mkEnableOption "Enable miku_cursor";
    mpd.enable = lib.mkEnableOption "Enable mpd";
    prismlauncher.enable = lib.mkEnableOption "Enable prismlauncher";
    ssh.enable = lib.mkEnableOption "Enable ssh";
    vesktop.enable = lib.mkEnableOption "Enable vesktop";

    gamedev.enable = lib.mkEnableOption "Enable gamedev";
    audioVisual.enable = lib.mkEnableOption "Enable audioVisual";
    school.enable = lib.mkEnableOption "Enable school";
    gaming.enable = lib.mkEnableOption "Enable gaming";
    signaldesktop.enable = lib.mkEnableOption "Enable signaldesktop";
  };

  config.myModules.home = {
    # codium.enable = lib.mkDefault false;
    firefox.enable = lib.mkDefault true;
    fish.enable = lib.mkDefault true;
    # git.enable = lib.mkDefault false;
    kitty.enable = lib.mkDefault true;
    # matrix.enable = lib.mkDefault false;
    miku_cursor.enable = lib.mkDefault true;
    # mpd.enable = lib.mkDefault false;
    # prismlauncher.enable = lib.mkDefault false;
    # ssh.enable = lib.mkDefault false;
    vesktop.enable = lib.mkDefault true;

    # gamedev.enable = lib.mkDefault false;
    # audioVisual.enable = lib.mkDefault false;
    # school.enable = lib.mkDefault false;
    # gaming.enable = lib.mkDefault false;
    # signaldesktop.enable = lib.mkDefault false;
  };
}