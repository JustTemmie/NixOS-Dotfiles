{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    shellIntegration.enableFishIntegration = true;

    font = {
      name = "FiraCode Nerd Font";
      size = 12;
    };

    settings = {
      scrollback_indicator_opacity = 0.5;
      background_opacity = 0.7;
      hide_window_decorations = true;
      window_padding_width = 6;
    };
  };
}
