{ options, lib, ... }:
{
  options.my.home.communication = {
    discord.enable = lib.mkEnableOption "Enable Discord";
  };
}
