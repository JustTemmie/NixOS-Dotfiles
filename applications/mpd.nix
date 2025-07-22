{ config, pkgs, ... }:

{
  users.users.twig.packages = with pkgs; [
    mpd
    mpc-cli
    mpd-discord-rpc
  ];

  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    XDG_RUNTIME_DIR = "/run/user/1000";
  };

  services.mpd = {
    enable = true;
    musicDirectory = "/home/twig/Music";
    user = "twig";
    network.listenAddress = "any";
    startWhenNeeded = true;

    extraConfig = ''
      audio_output {
        type            "pipewire"
        name            "PipeWire"
      }

      audio_output {
        type            "fifo"
        name            "Visualizer feed"
        path            "/tmp/mpd.fifo"
        format          "44100:16:2"
      }

      audio_output {
        type            "httpd"
        name            "MPD over HTTP"
        port            "6605"
        bitrate         "2048"                   # kb/s, default is 128
        format          "44100:16:1"
      }
    '';
  };

  systemd.services.mpd-discord-rpc = {
    enable = true;
    serviceConfig = {
      User = "twig";
      ExecStart = "mpd-discord-rpc";
    };
  };
}
