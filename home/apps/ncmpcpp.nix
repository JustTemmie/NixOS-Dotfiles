{ config, pkgs, ... }: {
  programs.ncmpcpp = {
    enable = true;
    package = pkgs.ncmpcpp.override { visualizerSupport = true; };
    settings = {
      visualizer_type = "spectrum";
      visualizer_color = "118, 116, 115, 114, 113, 186, 181, 216, 218, 219, 184, 216, 213, 207, 206, 205, 204, 203";
      visualizer_spectrum_smooth_look = "no";
      visualizer_fps = 120;
      visualizer_autoscale = false;
      visualizer_spectrum_dft_size = 1;
      visualizer_spectrum_gain = 0;
      display_bitrate = true;
      ignore_leading_the = true;
      ignore_diacritics = true;
      song_status_format = "{{%a{ $4%b$9{ (%y)}} - }{%t}}|{%f}";
    };
  };
}
