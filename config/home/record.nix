{ options, lib, ... }:
{
  options.my.home.recording = {
    obsStudio.enable = lib.mkEnableOption "Enable OBS Studio";
    gpu-screen-recorder.enable = lib.mkEnableOption "Enable gpu-screen-recorder";
  };
}
