{ options, lib, ... }:
{
  options.my.os.boot = {
    systemd-boot.enable = lib.mkEnableOption "Enable boot";
    useSystemdInitrd = lib.mkEnableOption "Use systemd initrd";
    kernelPackage = lib.mkOption {
      type = lib.types.nullOr lib.types.attrs;
      default = null;
      description = "Custom kernelPackages set to use (e.g., pkgs.linuxPackages_xanmod)";
    };
    nvidiaKernelModule.enable = lib.mkEnableOption "Enable NVIDIA kernel module in initrd";
  };

}
