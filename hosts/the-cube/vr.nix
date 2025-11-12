{ config, pkgs, ...}: {
  services.monado = {
    enable = true;
    defaultRuntime = true; # Register as default OpenXR runtime
  };

  systemd.user.services.monado.environment = {
    STEAMVR_LH_ENABLE = "1";
    XRT_COMPOSITOR_COMPUTE = "1";
    WMR_HANDTRACKING = "0";
  };

  programs.steam = let
    patchedBwrap = pkgs.bubblewrap.overrideAttrs (o: {
      patches = (o.patches or []) ++ [
        ./vr-bwrap.patch
      ];
    });
  in {
    enable = true;
    package = pkgs.steam.override {
      buildFHSEnv = (args: ((pkgs.buildFHSEnv.override {
        bubblewrap = patchedBwrap;
      }) (args // {
        extraBwrapArgs = (args.extraBwrapArgs or []) ++ [ "--cap-add ALL" ];
      })));
    };
  };
}