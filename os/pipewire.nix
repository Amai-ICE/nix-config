{lib, config, ...}:
{
  config = lib.mkIf config.my.os.pipewire.enable {
    # Enable Pipewire for audio management
    services.pipewire = {
      enable = true;
      pulse.enable = config.my.os.pipewire.pulseAudioSupport;
    };
  };
}