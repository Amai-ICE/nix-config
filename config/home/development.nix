{ options, lib, ... }:
{
  options.my.home.development = {
    vscode.enable = lib.mkEnableOption "Enable VS Code";
    vscode.extensions.nixIDE = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Nix IDE extensions";
    };
    direnv.enable = lib.mkEnableOption "Enable direnv";
    git.enable = lib.mkEnableOption "Enable git";
    gh.enable = lib.mkEnableOption "Enable GitHub CLI";
    lazygit.enable = lib.mkEnableOption "Enable lazygit";
    nixvim.enable = lib.mkEnableOption "Enable nixvim";
    unityhub.enable = lib.mkEnableOption "Enable Unity Hub";
    jetbrains = { 
      enable = lib.mkEnableOption "Enable JetBrains toolbox/products";
      products = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [ ];
        description = "List of JetBrains products to install";
      };
    };
  };
}
