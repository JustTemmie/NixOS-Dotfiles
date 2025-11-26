{ modulesPath, config, lib, pkgs, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")

    ./gpu.nix
    ./ollama.nix
    ./vr.nix
  ];

  environment.systemPackages = [
    pkgs.sm64coopdx
  ];


  myModules.samba.enable = true;
  myModules.steam.enable = true;

  networking.hostName = "the-cube";

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_latest;

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = "performance";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

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

    nameservers = [ "9.9.9.9" ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
