{ config, pkgs, ... }:

{
  home.packages = [ pkgs.mpc ];

  services.mpd = {
    enable = true;
    musicDirectory = "~/Music";
    playlistDirectory = "/home/twig/Music/PlaylistsMPD";
    
    network.startWhenNeeded = true;

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
}
