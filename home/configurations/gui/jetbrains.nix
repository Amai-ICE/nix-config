{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    jetbrains.rust-rover
    jetbrains.idea-community-bin
    #   idea-ultimate

    #android-studio
    androidStudioPackages.dev
  ];
}
