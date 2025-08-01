{ config, lib, ... }: {
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

  networking = {
    interfaces.enp17s0 = {
      ipv4.addresses = [{ 
        address = "192.168.1.100";
        prefixLength = 24;
      }];
    };
    defaultGateway = {
      address = "192.168.1.1";
      interface = "enp17s0";
    };

    nameservers = [ "192.168.1.2" "9.9.9.9" ];
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
