{
  services.mpdscribble = {
    enable = true;
    endpoints = {
      "last.fm" = {
        passwordFile = "/etc/nixos/private/lastfm_password";
        username = "lesbiandisaster";
      };
    };
  };
}