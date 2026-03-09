{ config, lib, pkgs, ... }:
let cfg = config.my.home.game ; in
{
  home.packages = with pkgs;
    lib.optionals cfg.prismlauncher.enable [
      (if cfg.prismlauncher.jdks != null
       then prismlauncher.override { jdks = cfg.prismlauncher.jdks; }
       else prismlauncher)
    ];
}