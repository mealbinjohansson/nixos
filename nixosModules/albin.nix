{
  lib,
  config,
  ...
}: {
  options = {
    albin.enable = lib.mkEnableOption "Enables albin user account";
  };

  config = lib.mkIf config.albin.enable {
    users.users.albin = {
      isNormalUser = true;
      description = "Albin";
      extraGroups = ["networkmanager" "wheel"];
    };
  };
}
