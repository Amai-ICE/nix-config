{ lib, config, ... }:
let cfg = config.my.os.boot; in {
  config.boot = lib.mkMerge [
    {
      initrd.systemd.enable = cfg.useSystemdInitrd;
    }
    (lib.mkIf (cfg.kernelPackage != null) {
      kernelPackages = cfg.kernelPackage;
    })

    (lib.mkIf cfg.systemd-boot.enable {
      loader.systemd-boot.enable = true;
      loader.efi.canTouchEfiVariables = true;
    })

    {
      initrd.kernelModules = lib.mkIf cfg.nvidiaKernelModule.enable [
        "nvidia"
        "nvidia_modeset"
        "nvidia_uvm"
        "nvidia_drm"
      ];
    }
  ];
}
