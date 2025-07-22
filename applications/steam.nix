{
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };
}




