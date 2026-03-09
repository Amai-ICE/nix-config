{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "nvme"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/3195f932-f6b4-46df-beaf-8e054127cfea";
    fsType = "btrfs";
    options = [
      "subvol=rootfs"
      "compress=zstd"
    ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/3195f932-f6b4-46df-beaf-8e054127cfea";
    fsType = "btrfs";
    options = [
      "subvol=nix"
      "compress=zstd"
      "noatime"
    ];
  };

  fileSystems."/partition-root" = {
    device = "/dev/disk/by-uuid/3195f932-f6b4-46df-beaf-8e054127cfea";
    fsType = "btrfs";
  };

  fileSystems."/.swapvol" = {
    device = "/dev/disk/by-uuid/3195f932-f6b4-46df-beaf-8e054127cfea";
    fsType = "btrfs";
    options = [
      "subvol=swap"
      "noatime"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/3195f932-f6b4-46df-beaf-8e054127cfea";
    fsType = "btrfs";
    options = [
      "subvol=home"
      "compress=zstd"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/5613-28B9";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };
  swapDevices = [
    {
      device = "/.swapvol/swapfile";
      size = 16 * 1024;
    }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
