{ lib, config, ... }:

{
  options = {
    nfs.enable = lib.mkEnableOption "Enables nfs client mounting";
  };

  config = lib.mkIf config.nfs.enable {
    fileSystems."/mnt/nas" = {
      device = "100.65.115.5:/tank/data";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" "x-systemd.idle-timeout=600" ];
    };
    boot.supportedFilesystems = [ "nfs" ];
  };
}
