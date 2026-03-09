{ options, lib, ... }:
{
  options.my.home.game = {
    prismlauncher = {
      enable = lib.mkEnableOption "Enable PrismLauncher";
      jdks = lib.mkOption {
        type = lib.types.nullOr (lib.types.listOf lib.types.package);
        default = null;
        description = "Custom JDK packages for PrismLauncher";
      };
    };
  };
}
