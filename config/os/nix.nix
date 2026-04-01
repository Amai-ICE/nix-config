{ options, lib, ... }:
{
  options.my.os.nix = {
    enable = lib.mkEnableOption "Enable Nix package manager";
    allowUnfree = lib.mkEnableOption "Allow unfree packages";
    allowExperimentalFeatures = lib.mkEnableOption "Allow experimental features in Nix";
    autoOptimiseStore = lib.mkEnableOption "Automatically optimise Nix store";
    nh = {
      enable = lib.mkEnableOption "Enable Nix-History (nh) tool";
      flake = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "Flake path for nh (e.g. /home/amaiice/.nixos_confg)";
      };
      clean = {
        enable = lib.mkEnableOption "Enable automatic cleaning of Nix store";
        cleanupGarbageAfterDays = lib.mkOption {
          type = lib.types.nullOr lib.types.int;
          default = null;
          description = "Number of days after which to clean up garbage in Nix store";
        };
        keepOldGenerations = lib.mkOption {
          type = lib.types.nullOr lib.types.int;
          default = null;
          description = "Number of old generations to keep when cleaning Nix store";
        };
      };
    };
  };
}
