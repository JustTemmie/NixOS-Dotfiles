{ pkgs, ... }: {
  # moved to system app due to compilation issues
  # programs.vesktop.enable = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/discord" = "vesktop.desktop";
    };
  };
}