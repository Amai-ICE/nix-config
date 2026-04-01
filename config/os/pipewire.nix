{ options, lib, ... }:
{
  options.my.os.pipewire = {
    enable = lib.mkEnableOption "Enable Pipewire for audio management";
    pulseAudioSupport = lib.mkEnableOption "Enable PulseAudio support in Pipewire";
  };
}
