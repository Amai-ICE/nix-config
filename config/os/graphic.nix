{ options, lib, ... }:
{
  options.my.os.graphic = {
    enable = lib.mkEnableOption "Enable graphic related settings";
    nvidia = {
      enable = lib.mkEnableOption "Enable NVIDIA graphics";
      kernelModule = {
        enable = lib.mkEnableOption "Enable NVIDIA kernel module in initrd";
      };
      modesetting = {
        enable = lib.mkEnableOption "Enable modesetting for NVIDIA";
      };
      package = lib.mkOption {
        type = lib.types.package;
        default = lib.mkDefault null;
        description = "NVIDIA driver package to use";
      };
      openSourceDriver = lib.mkEnableOption "Use open source NVIDIA driver (Nouveau)";
      nvidiaSettings = lib.mkEnableOption "Install NVIDIA settings utility";
    };
  };
}
