{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.home.game;
in
{
  home.packages =
    with pkgs;

    (lib.optionals cfg.prismlauncher.enable [
      (
        if cfg.prismlauncher.jdks != null then
          prismlauncher.override { jdks = cfg.prismlauncher.jdks; }
        else
          prismlauncher
      )
    ])
    ++ lib.optionals cfg.bottles.enable [
      bottles
      freetype
    ];
  programs.lutris = {
    enable = cfg.lutris.enable;
  };
  nixpkgs.overlays = [
    (_: prev: {
      openldap = prev.openldap.overrideAttrs {
        doCheck = !prev.stdenv.hostPlatform.isi686;
      };
    })
    (final: prev: {
      pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
        (python-final: python-prev: {
          patool = python-prev.patool.overrideAttrs (oldAttrs: {
            doCheck = false;
            doInstallCheck = false;
          });
        })
      ];
    })
  ];
}
