{ config, pkgs, ... }: {
  programs.cava = {
    enable = true;
  };

  programs.rmpc = {
    enable = true;
    config = ''
    (
      max_fps: 60
    )
    '';
  };
}
