{ lib, config, ... }:

{
  options = {
    tailscale.enable = lib.mkEnableOption "Enables tailscale networking";
  };

  config = lib.mkIf config.tailscale.enable {
    services.tailscale = {
      enable = true;
      extraDaemonFlags = ["--no-logs-no-support"];
    };
  };
}
