{lib, config, ...}:
let cfg = config.my.os.graphic; in
{
  config = lib.mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    hardware.nvidia = lib.mkIf cfg.nvidia.enable {
      modesetting.enable = cfg.nvidia.modesetting.enable;
      package = cfg.nvidia.package;
      open = cfg.nvidia.openSourceDriver;
      nvidiaSettings = cfg.nvidia.nvidiaSettings;
    };

    my.os = lib.mkIf cfg.nvidia.enable {
      boot.nvidiaKernelModule.enable = lib.mkDefault cfg.nvidia.kernelModule.enable;
      xserver.nvidiacompability.enable = lib.mkDefault true;
    };
  };
}