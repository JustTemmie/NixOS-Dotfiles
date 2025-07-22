{ config, lib, pkgs, modulesPath, ... }:

{
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
      device = "/dev/disk/by-uuid/af235f11-af74-47f4-b147-541d58bb70c5";
      fsType = "xfs";
  };

  fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/B0B5-3752";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
  };

  fileSystems."/mnt/steam" = {
      device = "/dev/disk/by-uuid/300fac90-e065-4666-99f8-c5c6b24b6823";
      fsType = "btrfs";
  };
   

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp17s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp19s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp16s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
