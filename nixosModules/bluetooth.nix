{
  lib,
  config,
  ...
}: {
  options = {
    bluetooth.enable = lib.mkEnableOption "Enables bluetooth module";
  };

  config = lib.mkIf config.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = true;
        };
      };
    };
  };
}
