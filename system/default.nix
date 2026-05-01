{ lib, ... }: {
  imports = [
    ./apps/docker.nix
    ./apps/steam.nix

    ./environment/colemak.nix
    ./environment/cosmic.nix
    ./environment/locale.nix
    ./environment/networking.nix
    ./environment/pipewire.nix
    ./environment/plasma.nix
    ./environment/samba.nix
  ];

  options.myModules.system = {
    docker.enable = lib.mkEnableOption "Enable docker";
    steam.enable = lib.mkEnableOption "Enable steam";

    colemak.enable = lib.mkEnableOption "Enable colemak";
    cosmic.enable = lib.mkEnableOption "Enable cosmic";
    locale.enable = lib.mkEnableOption "Enable locale";
    networking.enable = lib.mkEnableOption "Enable networking";
    pipewire.enable = lib.mkEnableOption "Enable pipewire";
    plasma.enable = lib.mkEnableOption "Enable plasma";
    samba.enable = lib.mkEnableOption "Enable samba";
  };

  config.myModules.system = {
    docker.enable = lib.mkDefault true;
    steam.enable = lib.mkDefault true;

    colemak.enable = lib.mkDefault true;
    cosmic.enable = lib.mkDefault true;
    locale.enable = lib.mkDefault true;
    networking.enable = lib.mkDefault true;
    pipewire.enable = lib.mkDefault true;
    plasma.enable = lib.mkDefault true;
    # samba.enable = lib.mkDefault false;
  };
}

