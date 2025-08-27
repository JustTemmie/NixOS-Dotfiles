{ config, pkgs, ... }: {
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  boot.kernelModules = [ "snd-seq" "snd-rawmidi" ];

  services.pipewire = {
    enable = true;
    
    alsa.enable = true;
    alsa.support32Bit = true;

    pulse.enable = true;

    # jack.enable = true;

    # extraConfig.pipewire."91-null-sinks" = {
    #   "context.objects" = [
    #     {
    #       # A default dummy driver. This handles nodes marked with the "node.always-driver"
    #       # property when no other driver is currently active. JACK clients need this.
    #       factory = "spa-node-factory";
    #       args = {
    #         "factory.name"     = "support.node.driver";
    #         "node.name"        = "Dummy-Driver";
    #         "priority.driver"  = 8000;
    #       };
    #     }
    #   ];
    # };
    extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 32;
        "default.clock.min-quantum" = 32;
        "default.clock.max-quantum" = 32;
      };
    };
  };

  users.extraUsers.twig.extraGroups = [ "jackaudio" "audio" ];
}
