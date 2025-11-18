{ pkgs, ... }: {
  programs.vesktop.enable = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
<<<<<<< HEAD
      "x-scheme-handler/discord" = "vesktop.desktop";
=======
      "text/html" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";
>>>>>>> origin/main
    };
  };
}