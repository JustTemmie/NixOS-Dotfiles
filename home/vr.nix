{
  config,
  osConfig ? { },
  pkgs,
  ...
}:

# TODO: Move in system profile, apply for each user
# https://codeberg.org/Yuugen/nixos-config/search/branch/main?path=&q=vr&mode=exact
{
  assertions = [
    {
      assertion = osConfig != { };
      message = ''
        You enabled the home VR module without enabling the system one, or you are using this flake on a system other than NixOS.
        This will _not_ work, you have been warned.
      '';
    }
  ];

  xdg.configFile."openxr/xrizer".source = "${pkgs.xrizer}";
  xdg.configFile."openxr/1/active_runtime.json".source =
    osConfig.environment.etc."xdg/openxr/1/active_runtime.json".source;

  xdg.configFile."openvr/openvrpaths.vrpath".text = ''
    {
      "config" :
      [
        "${config.xdg.dataHome}/Steam/config"
      ],
      "external_drivers" : null,
      "jsonid" : "vrpathreg",
      "log" :
      [
        "${config.xdg.dataHome}/Steam/logs"
      ],
      "runtime":
      [
        "${config.xdg.configHome}/openxr/xrizer/lib/xrizer",
        "${config.xdg.dataHome}/Steam/steamapps/common/SteamVR"
      ],
      "version" : 1
    }
  '';

  home.file.".local/share/monado/hand-tracking-models".source = pkgs.fetchgit {
    url = "https://gitlab.freedesktop.org/monado/utilities/hand-tracking-models";
    sha256 = "x/X4HyyHdQUxn3CdMbWj5cfLvV7UyQe1D01H93UCk+M=";
    fetchLFS = true;
  };
}
