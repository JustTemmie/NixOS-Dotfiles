{ pkgs, ... }: {
  # programs.vesktop.enable = true;
  home.packages = [
    pkgs.stable.vesktop
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/discord" = "vesktop.desktop";
    };
  };
}