{ config, pkgs, ... }: {
  services.mpd-discord-rpc = {
    enable = true;
    settings = {
      id = 1397363004676509729;
      format = {
        display_type = "details";
      };
    };
  };
}
