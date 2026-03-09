{ options, lib, ...}:
{
  options.my.os.nix-ld = {
    enable = lib.mkEnableOption "Enable nix-ld for non-root nix usage";

    allowReplaceLDLibraryPath = lib.mkEnableOption "Allow replacing LD_LIBRARY_PATH in nix-ld wrapper";
  };
}