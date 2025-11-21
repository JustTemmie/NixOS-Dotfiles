{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.nixpkgs-xr.nixosModules.nixpkgs-xr
  ];
  nixpkgs.xr.enable = true;

  services.monado = {
    enable = true;
    defaultRuntime = true;
    package = inputs.nixpkgs-xr.packages.${pkgs.system}.monado;
  };

  environment.systemPackages = with pkgs; [
    motoc
    v4l-utils
    wayvr-dashboard
    wlx-overlay-s
    xrbinder
    xrizer
  ];

  programs.steam.extraCompatPackages = with pkgs; [
    proton-ge-rtsp-bin
  ];

  systemd.user.services = {
    monado = {
      environment = {
        STEAMVR_LH_ENABLE = "1";
        XRT_COMPOSITOR_COMPUTE = "1";
      };
    };

    # Auto launch wlr-overlay-s with monado
    wlr-overlay-s = {
      description = "VR wlx-overlay-s";
      path = [ pkgs.wayvr-dashboard ];
      serviceConfig = {
        ExecStart = "${pkgs.wlx-overlay-s}/bin/wlx-overlay-s";
        Restart = "on-abnormal";
      };
      bindsTo = [ "monado.service" ];
      partOf = [ "monado.service" ];
      after = [ "monado.service" ];
      upheldBy = [ "monado.service" ];
      unitConfig.ConditionUser = "!root";
    };
  };
}
