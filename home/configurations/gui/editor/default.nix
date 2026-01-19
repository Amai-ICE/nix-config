{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zettlr
    unityhub
    blender
    vscode
  ];
}
