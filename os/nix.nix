{ lib, config, ... }:
let
  cfg = config.my.os.nix;
in
{
  config = lib.mkIf cfg.enable {
    nix.settings = {
      auto-optimise-store = cfg.autoOptimiseStore;
      experimental-features = lib.optionals cfg.allowExperimentalFeatures [
        "nix-command"
        "flakes"
      ];
      #       kernelPackage = pkgs.cachyosKernels.linuxPackages-cachyos-latest-x86_64-v4;

      substituters = [ "https://attic.xuyh0120.win/lantian" ];
      trusted-public-keys = [
        "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      ];
    };

    programs.nh = lib.mkIf cfg.nh.enable (
      lib.mkMerge [
        {
          enable = true;
          clean = {
            enable = cfg.nh.clean.enable;
            extraArgs = lib.concatStringsSep " " (
              (lib.optionals (cfg.nh.clean.cleanupGarbageAfterDays != null) [
                "--keep-since"
                (toString cfg.nh.clean.cleanupGarbageAfterDays)
              ])
              ++ (lib.optionals (cfg.nh.clean.keepOldGenerations != null) [
                "--keep"
                (toString cfg.nh.clean.keepOldGenerations)
              ])
            );
          };
        }
        (lib.mkIf (cfg.nh.flake != null) {
          flake = cfg.nh.flake;
        })
      ]
    );
  };
}
