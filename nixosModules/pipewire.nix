{
  lib,
  config,
  ...
}: {
  options = {
    pipewire.enable = lib.mkEnableOption "Enables pipewire based sound";
  };

  config = lib.mkIf config.pipewire.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
