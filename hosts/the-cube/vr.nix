{ pkgs, config, lib, ... }: {
  services.monado = {
    enable = true;
    defaultRuntime = false;
  };

  systemd.user.services.monado.environment = {
    STEAMVR_LH_ENABLE = "1";
    XRT_COMPOSITOR_COMPUTE = "1";
  };

  hardware.steam-hardware.enable = true;

  boot.kernelPatches = [
    { # see https://wiki.nixos.org/wiki/VR#Applying_as_a_NixOS_kernel_patch
      name = "amdgpu-ignore-ctx-privileges";
      patch = pkgs.fetchpatch {
        name = "cap_sys_nice_begone.patch";
        url = "https://github.com/Frogging-Family/community-patches/raw/master/linux61-tkg/cap_sys_nice_begone.mypatch";
        hash = "sha256-Y3a0+x2xvHsfLax/uwycdJf3xLxvVfkfDVqjkxNaYEo=";
      };
    }
  ];
}