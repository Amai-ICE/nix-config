{ lib, config, ... }:
let
  cfg = config.my.os.nix;
in
{
  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = cfg.allowUnfree;

    nix.settings = {
      auto-optimise-store = cfg.autoOptimiseStore;
      experimental-features = lib.optionals cfg.allowExperimentalFeatures [
        "nix-command"
        "flakes"
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
