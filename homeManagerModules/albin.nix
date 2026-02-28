{
  lib,
  config,
  ...
}: {
  options = {
    albin.enable = lib.mkEnableOption "Enables albin user";
  };

  config = lib.mkIf config.albin.enable {
    home.username = "albin";
    home.homeDirectory = "/home/albin";
    programs.home-manager.enable = true;
  };
}
