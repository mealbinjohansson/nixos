{
  lib,
  config,
  ...
}: {
  options = {
    hyprland.enable = lib.mkEnableOption "Enables hyprland module";
  };

  config = lib.mkIf config.hyprland.enable {
    programs.hyprland.enable = true;
    programs.hyprlock.enable = true;
  };
}
