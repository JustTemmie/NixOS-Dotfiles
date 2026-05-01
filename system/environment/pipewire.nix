{ lib, config, pkgs, ... }: {
  config = lib.mkIf config.myModules.system.samba.enable {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;

    boot.kernelModules = [ "snd-seq" "snd-rawmidi" ];

    services.pipewire = {
      enable = true;
      
      alsa.enable = true;
      alsa.support32Bit = true;

      pulse.enable = true;
    };

    environment.systemPackages = with pkgs; [
      pavucontrol
    ];
  };
}
