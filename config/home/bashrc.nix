{ options, lib, ... }:
{
  options.my.home.bashrc = {
    fishIntegration = lib.mkEnableOption "Enable integration with fish";
    kittyIntegration = lib.mkEnableOption "Enable integration with kitty when using ssh";
  };
}
